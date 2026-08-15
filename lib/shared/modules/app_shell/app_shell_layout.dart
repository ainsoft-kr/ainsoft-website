import 'package:flutter/material.dart';

import 'app_shell_bottom_nav_bar.dart';
import 'app_shell_responsive.dart';
import 'widgets/app_shell_footer.dart';
import 'widgets/app_shell_header.dart';

class AppShellLayout extends StatefulWidget {
  const AppShellLayout({
    super.key,
    required this.currentRoute,
    required this.child,
  });

  final String currentRoute;
  final Widget child;

  @override
  State<AppShellLayout> createState() => _AppShellLayoutState();
}

class _AppShellLayoutState extends State<AppShellLayout> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant AppShellLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentRoute == widget.currentRoute) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      _scrollController.jumpTo(0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F1E8),
      bottomNavigationBar: responsive.isMobile
          ? AppShellBottomNavBar(currentRoute: widget.currentRoute)
          : null,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF7F2EA), Color(0xFFEEE4D3), Color(0xFFE5ECDD)],
          ),
        ),
        child: SafeArea(
          child: PrimaryScrollController(
            controller: _scrollController,
            child: Column(
              children: [
                AppShellHeader(currentRoute: widget.currentRoute),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: Column(
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 160),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeOut,
                              transitionBuilder: (widget, animation) =>
                                  FadeTransition(opacity: animation, child: widget),
                              child: KeyedSubtree(
                                key: ValueKey(widget.currentRoute),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: responsive.isMobile ? 20 : 28,
                                  ),
                                  child: widget.child,
                                ),
                              ),
                            ),
                            AppShellFooter(
                              responsive: responsive,
                              currentRoute: widget.currentRoute,
                            ),
                          ],
                        ),
                      ),
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
