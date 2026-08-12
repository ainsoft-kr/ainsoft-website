import 'package:flutter/material.dart';

import '/modules/posts/data/models/post_model.dart';
import '/modules/posts/views/widgets/post_list_tile.dart';
import '/shared/modules/app_shell/app_shell_responsive.dart';

class PostsListView extends StatefulWidget {
  const PostsListView({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  static const _pageSize = 9;

  int _currentPage = 0;

  int get _pageCount {
    if (widget.posts.isEmpty) return 1;
    return (widget.posts.length / _pageSize).ceil();
  }

  List<PostModel> get _visiblePosts {
    final start = _currentPage * _pageSize;
    final end = start + _pageSize > widget.posts.length
        ? widget.posts.length
        : start + _pageSize;
    return widget.posts.sublist(start, end);
  }

  @override
  void didUpdateWidget(covariant PostsListView _) {
    super.didUpdateWidget(oldWidget);
    if (_currentPage >= _pageCount) {
      _currentPage = _pageCount - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);
    final columns = responsive.isBrowser
        ? 3
        : responsive.isTablet
        ? 2
        : 1;
    final posts = _visiblePosts;

    return Padding(
      padding: responsive.sectionPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: responsive.isMobile ? 12 : 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: responsive.isMobile
                      ? 320
                      : responsive.isTablet
                      ? 320
                      : 340,
                ),
                itemBuilder: (context, index) =>
                    PostListTile(post: posts[index]),
              ),
              const SizedBox(height: 28),
              _PostsPagination(
                currentPage: _currentPage,
                pageCount: _pageCount,
                onPageSelected: (page) {
                  setState(() => _currentPage = page);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostsPagination extends StatelessWidget {
  const _PostsPagination({
    required this.currentPage,
    required this.pageCount,
    required this.onPageSelected,
  });

  final int currentPage;
  final int pageCount;
  final ValueChanged<int> onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: '포스트 페이지 이동',
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          IconButton(
            tooltip: '이전 페이지',
            onPressed: currentPage == 0
                ? null
                : () => onPageSelected(currentPage - 1),
            icon: const Icon(Icons.chevron_left_rounded),
          ),
          for (var page = 0; page < pageCount; page++)
            _PageButton(
              page: page,
              selected: page == currentPage,
              onPressed: () => onPageSelected(page),
            ),
          IconButton(
            tooltip: '다음 페이지',
            onPressed: currentPage == pageCount - 1
                ? null
                : () => onPageSelected(currentPage + 1),
            icon: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.page,
    required this.selected,
    required this.onPressed,
  });

  final int page;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final label = '${page + 1}페이지';
    final button = selected
        ? FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              minimumSize: const Size(42, 42),
              padding: EdgeInsets.zero,
              backgroundColor: const Color(0xFF0F2A2B),
              foregroundColor: Colors.white,
            ),
            child: Text('${page + 1}'),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(42, 42),
              padding: EdgeInsets.zero,
              foregroundColor: const Color(0xFF28594B),
              side: BorderSide(
                color: const Color(0xFF0F2A2B).withValues(alpha: 0.16),
              ),
            ),
            child: Text('${page + 1}'),
          );

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: button,
    );
  }
}
