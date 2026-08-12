import 'package:flutter/material.dart';
import 'package:flutter_smooth_markdown/flutter_smooth_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';
import '/modules/posts/data/models/post_model.dart';
import '/modules/posts/data/services/post_service.dart';
import '/shared/modules/app_shell/app_shell_responsive.dart';
import '/shared/design/app_font_config.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.slug});

  final String slug;
  static final _service = PostService();

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);

    return FutureBuilder<PostModel>(
      future: _service.fetchPostBySlug(slug),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(100),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return _PostNotFound(slug: slug);
        }

        final post = snapshot.data!;
        return Padding(
          padding: responsive.sectionPadding,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 860),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: RouteManager.toPosts,
                    icon: const Icon(Icons.arrow_back_rounded),
                    label: const Text('모든 포스트'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF28594B),
                    ),
                  ),
                  const SizedBox(height: 22),
                  _PostHeader(post: post, responsive: responsive),
                  const SizedBox(height: 26),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(responsive.isMobile ? 20 : 44),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.88),
                      borderRadius:
                          BorderRadius.circular(responsive.isMobile ? 20 : 28),
                      border: Border.all(
                        color: const Color(0xFF0F2A2B).withValues(alpha: 0.07),
                      ),
                    ),
                    child: SmoothMarkdown(
                      data: post.markdown,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet.light(),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: RouteManager.toPosts,
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('포스트 목록으로 돌아가기'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({required this.post, required this.responsive});

  final PostModel post;
  final AppShellResponsive responsive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.isMobile ? 4 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${post.category.toUpperCase()}  /  ${post.date}',
            style: GoogleFonts.dmSans(
              color: const Color(0xFFC86E42),
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
          const SizedBox(height: 16),
          Text(
            post.title,
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF0F2A2B),
              fontSize: responsive.isMobile ? 34 : 54,
              fontWeight: FontWeight.w700,
              height: 1.05,
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
          if (post.excerpt.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              post.excerpt,
              style: GoogleFonts.dmSans(
                color: const Color(0xFF53635C),
                fontSize: 17,
                height: 1.65,
              ).copyWith(fontFamilyFallback: appFontFallback),
            ),
          ],
        ],
      ),
    );
  }
}

class _PostNotFound extends StatelessWidget {
  const _PostNotFound({required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 120),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.article_outlined, size: 48),
            const SizedBox(height: 18),
            Text('포스트를 찾을 수 없습니다.',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(slug),
            const SizedBox(height: 22),
            FilledButton(
              onPressed: RouteManager.toPosts,
              child: const Text('목록으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
