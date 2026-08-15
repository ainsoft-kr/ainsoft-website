import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';

void _scrollShellToTop(BuildContext context) {
  final controller = PrimaryScrollController.maybeOf(context);
  if (controller == null || !controller.hasClients) return;
  controller.jumpTo(0);
}

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, required this.fullWidth});

  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: () {
        _scrollShellToTop(context);
        RouteManager.toContact();
      },
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF0F2A2B),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      ),
      child: const Text('문의하기'),
    );

    if (!fullWidth) return button;
    return SizedBox(width: double.infinity, child: button);
  }
}
