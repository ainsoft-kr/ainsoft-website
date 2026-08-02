import 'package:flutter/material.dart';

import '/modules/posts/data/models/post_model.dart';
import '/modules/posts/data/services/post_service.dart';
import '/modules/posts/views/widgets/posts_list_view.dart';
import '/shared/modules/app_shell/app_shell_responsive.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  static final _service = PostService();

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);

    return Column(
      children: [
        _PostsIntro(responsive: responsive),
        FutureBuilder<List<PostModel>>(
          future: _service.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(72),
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const _PostsMessage(
                title: '포스트를 불러오지 못했습니다.',
                body: 'manifest.json과 Markdown asset 경로를 확인해 주세요.',
              );
            }

            final posts = snapshot.data ?? const <PostModel>[];
            if (posts.isEmpty) {
              return const _PostsMessage(
                title: '아직 공개된 포스트가 없습니다.',
                body: 'assets/posts 폴더에 Markdown 파일을 추가해 주세요.',
              );
            }

            return PostsListView(posts: posts);
          },
        ),
      ],
    );
  }
}

class _PostsIntro extends StatelessWidget {
  const _PostsIntro({required this.responsive});

  final AppShellResponsive responsive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: responsive.sectionPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(responsive.isMobile ? 24 : 42),
            decoration: BoxDecoration(
              color: const Color(0xFF0F2A2B),
              borderRadius: BorderRadius.circular(responsive.sectionRadius),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x180F2A2B),
                  blurRadius: 30,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POST / FIELD NOTES',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color(0xFFE3A16F),
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                ),
                const SizedBox(height: 18),
                Text(
                  '작업의 맥락을\n기록합니다.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: const Color(0xFFF7F2EA),
                        fontWeight: FontWeight.w700,
                        height: 1.05,
                      ),
                ),
                const SizedBox(height: 18),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 580),
                  child: Text(
                    'AI를 실제 현장에 연결하며 배운 것, 만든 것, 다시 질문하게 된 것들을 남깁니다.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFD7E2DC),
                          height: 1.7,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostsMessage extends StatelessWidget {
  const _PostsMessage({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 80),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(body, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
