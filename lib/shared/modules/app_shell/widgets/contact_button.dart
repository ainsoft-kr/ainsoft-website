import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';

void _scrollShellToTop(BuildContext context) {
  final controller = PrimaryScrollController.maybeOf(context);
  if (controller == null || !controller.hasClients) return;
  controller.jumpTo(0);
}

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.fullWidth,
    this.compact = false,
  });

  final bool fullWidth;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: () {
        _scrollShellToTop(context);
        RouteManager.toContact();
      },
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFFC86E42),
        foregroundColor: Colors.white,
        padding: compact
            ? const EdgeInsets.symmetric(horizontal: 14, vertical: 10)
            : const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('도입 상담'),
    );

    if (!fullWidth) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}
