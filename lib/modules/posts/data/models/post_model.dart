import 'dart:convert';

List<PostModel> postModelFromJson(List<dynamic> json) => json
    .map((item) => PostModel.fromJson(item as Map<String, dynamic>))
    .toList();

String postModelToJson(List<PostModel> data) =>
    json.encode(data.map((post) => post.toJson()).toList());

/// Metadata and rendered source for one Markdown post.
class PostModel {
  const PostModel({
    required this.slug,
    required this.title,
    required this.date,
    required this.category,
    required this.excerpt,
    required this.markdownPath,
    this.markdown = '',
  });

  final String slug;
  final String title;
  final String date;
  final String category;
  final String excerpt;
  final String markdownPath;
  final String markdown;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        slug: json['slug']?.toString() ?? '',
        title: json['title']?.toString() ?? 'Untitled post',
        date: json['date']?.toString() ?? '',
        category: json['category']?.toString() ?? 'Notes',
        excerpt: json['excerpt']?.toString() ?? '',
        markdownPath: json['markdownPath']?.toString() ?? '',
        markdown: json['markdown']?.toString() ?? '',
      );

  PostModel copyWith({String? markdown}) => PostModel(
        slug: slug,
        title: title,
        date: date,
        category: category,
        excerpt: excerpt,
        markdownPath: markdownPath,
        markdown: markdown ?? this.markdown,
      );

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'title': title,
        'date': date,
        'category': category,
        'excerpt': excerpt,
        'markdownPath': markdownPath,
      };
}
