import 'dart:convert';

import 'package:flutter/services.dart';

import '/modules/posts/data/models/post_model.dart';

class PostService {
  static const manifestPath = 'assets/posts/manifest.json';

  Future<List<PostModel>> fetchPosts() async {
    final manifest = await rootBundle.loadString(manifestPath);
    final decoded = jsonDecode(manifest) as List<dynamic>;
    final posts = postModelFromJson(decoded);
    posts.sort((a, b) => b.date.compareTo(a.date));
    return posts;
  }

  Future<PostModel> fetchPostBySlug(String slug) async {
    final posts = await fetchPosts();
    PostModel? post;
    for (final item in posts) {
      if (item.slug == slug) {
        post = item;
        break;
      }
    }

    if (post == null) {
      throw StateError('Post not found: $slug');
    }

    final source = await rootBundle.loadString(post.markdownPath);
    return post.copyWith(markdown: _removeFrontMatter(source));
  }

  String _removeFrontMatter(String source) {
    if (!source.startsWith('---')) return source.trim();

    final closingMarker = source.indexOf('\n---', 3);
    if (closingMarker == -1) return source.trim();

    return source.substring(closingMarker + '\n---'.length).trim();
  }
}
