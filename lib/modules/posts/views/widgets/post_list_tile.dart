import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';
import '/modules/posts/data/models/post_model.dart';
import '/shared/modules/app_shell/app_shell_responsive.dart';

class PostListTile extends StatefulWidget {
  const PostListTile({super.key, required this.post});

  final PostModel post;

  @override
  State<PostListTile> createState() => _PostListTileState();
}

class _PostListTileState extends State<PostListTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        child: Material(
          color: Colors.white.withValues(alpha: 0.82),
          elevation: _hovered ? 8 : 2,
          shadowColor: const Color(0x330F2A2B),
          borderRadius: BorderRadius.circular(responsive.isMobile ? 20 : 26),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => RouteManager.toPost(widget.post.slug),
            child: Padding(
              padding: EdgeInsets.all(responsive.isMobile ? 20 : 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _PostBadge(label: widget.post.category),
                      const Spacer(),
                      Text(
                        widget.post.date,
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF6C7771),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    widget.post.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF0F2A2B),
                      fontSize: responsive.isMobile ? 22 : 24,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),
                  if (widget.post.excerpt.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      widget.post.excerpt,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFF53635C),
                        fontSize: 14,
                        height: 1.55,
                      ),
                    ),
                  ],
                  const Spacer(),
                  Divider(
                    height: 28,
                    color: const Color(0xFF0F2A2B).withValues(alpha: 0.10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '읽어보기',
                        style: GoogleFonts.dmSans(
                          color: _hovered
                              ? const Color(0xFFC86E42)
                              : const Color(0xFF28594B),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 180),
                        turns: _hovered ? 0.12 : 0,
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          color: _hovered
                              ? const Color(0xFFC86E42)
                              : const Color(0xFF0F2A2B),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PostBadge extends StatelessWidget {
  const _PostBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFE7F0E9),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: GoogleFonts.dmSans(
            color: const Color(0xFF28594B),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
