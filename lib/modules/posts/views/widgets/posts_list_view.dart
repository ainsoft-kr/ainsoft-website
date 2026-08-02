import 'package:flutter/material.dart';

import '/modules/posts/data/models/post_model.dart';
import '/modules/posts/views/widgets/post_list_tile.dart';
import '/shared/modules/app_shell/app_shell_responsive.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);

    return Padding(
      padding: responsive.sectionPadding,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Column(
            children: [
              for (var index = 0; index < posts.length; index++) ...[
                PostListTile(post: posts[index]),
                if (index != posts.length - 1) const SizedBox(height: 14),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
