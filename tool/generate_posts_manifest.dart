import 'dart:convert';
import 'dart:io';

void main() {
  final postsDirectory = Directory('assets/posts');
  if (!postsDirectory.existsSync()) {
    postsDirectory.createSync(recursive: true);
  }

  final posts = postsDirectory
      .listSync()
      .whereType<File>()
      .where((file) => file.path.toLowerCase().endsWith('.md'))
      .map(_buildManifestEntry)
      .toList()
    ..sort((a, b) {
      final dateComparison =
          (b['date'] as String).compareTo(a['date'] as String);
      if (dateComparison != 0) return dateComparison;
      return (a['slug'] as String).compareTo(b['slug'] as String);
    });

  final manifest = File('assets/posts/manifest.json');
  manifest.writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert(posts)}\n',
  );
  stdout.writeln('Generated ${posts.length} post manifest entries.');
}

Map<String, dynamic> _buildManifestEntry(File file) {
  final source = file.readAsStringSync();
  final metadata = _frontMatter(source);
  final fileName = file.uri.pathSegments.last;
  final stem = fileName.substring(0, fileName.length - 3);
  final slug = _slugify(stem);

  return {
    'slug': slug,
    'title': metadata['title'] ?? _titleFromStem(stem),
    'date': metadata['date'] ?? '',
    'category': metadata['category'] ?? 'Notes',
    'excerpt': metadata['excerpt'] ?? '',
    'markdownPath': 'assets/posts/$fileName',
  };
}

Map<String, String> _frontMatter(String source) {
  if (!source.startsWith('---')) return {};

  final closingMarker = source.indexOf('\n---', 3);
  if (closingMarker == -1) return {};

  final header = source.substring(4, closingMarker);
  final metadata = <String, String>{};
  for (final line in header.split('\n')) {
    final separator = line.indexOf(':');
    if (separator <= 0) continue;

    final key = line.substring(0, separator).trim();
    final value = line.substring(separator + 1).trim();
    metadata[key] = _unquote(value);
  }
  return metadata;
}

String _unquote(String value) {
  if (value.length >= 2 &&
      ((value.startsWith('"') && value.endsWith('"')) ||
          (value.startsWith("'") && value.endsWith("'")))) {
    return value.substring(1, value.length - 1);
  }
  return value;
}

String _slugify(String value) {
  final slug = value
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9가-힣]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  return slug.isEmpty ? 'post' : slug;
}

String _titleFromStem(String stem) {
  return stem
      .replaceAll(RegExp(r'[-_]+'), ' ')
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
      .join(' ');
}
