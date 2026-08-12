import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';
import '/shared/design/app_font_config.dart';
import '/shared/design/design.dart';
import 'app_shell_responsive.dart';

void _scrollShellToTop(BuildContext context) {
  final controller = PrimaryScrollController.maybeOf(context);
  if (controller == null || !controller.hasClients) return;
  controller.jumpTo(0);
}

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
                _AppShellHeader(currentRoute: widget.currentRoute),
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
                            _AppShellFooter(
                              responsive: responsive,
                              currentRoute: widget.currentRoute,
                            ),
                          ],
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
    );
  }
}

class _AppShellHeader extends StatelessWidget {
  const _AppShellHeader({required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);
    final items = <_AppShellNavItem>[
      const _AppShellNavItem(label: 'Home', route: RouteManager.initialRoute),
      const _AppShellNavItem(label: 'About', route: RouteManager.aboutRoute),
      const _AppShellNavItem(
        label: 'Products',
        route: RouteManager.productsRoute,
      ),
      const _AppShellNavItem(
        label: 'Solutions',
        route: RouteManager.solutionsRoute,
      ),
      const _AppShellNavItem(
        label: 'Services',
        route: RouteManager.servicesRoute,
      ),
      const _AppShellNavItem(
        label: 'Post',
        route: RouteManager.postsRoute,
      ),
      const _AppShellNavItem(
        label: 'Contact',
        route: RouteManager.contactRoute,
      ),
    ];

    return Padding(
      padding: responsive.pagePadding.copyWith(
        bottom: responsive.isMobile ? 10 : 12,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile ? 14 : 18,
              vertical: responsive.isMobile ? 12 : 14,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.84),
              borderRadius: BorderRadius.circular(
                responsive.isMobile ? 18 : 24,
              ),
              border: Border.all(
                color: const Color(0xFF0F2A2B).withValues(alpha: 0.08),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x140F2A2B),
                  blurRadius: 30,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: responsive.isBrowser
                ? Row(
                    children: [
                      _BrandMark(isMobile: false),
                      const Spacer(),
                      for (final item in items)
                        _AppShellNavLink(
                          label: item.label,
                          active: _isActive(item.route),
                          onTap: () => _navigate(context, item.route),
                        ),
                      const SizedBox(width: 10),
                      const _ContactButton(fullWidth: false),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          _BrandMark(isMobile: responsive.isMobile),
                          const Spacer(),
                          PopupMenuButton<String>(
                            tooltip: 'Open navigation',
                            onSelected: (route) => _navigate(context, route),
                            itemBuilder: (context) => [
                              for (final item in items)
                                PopupMenuItem<String>(
                                  value: item.route,
                                  child: Text(item.label),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: responsive.gap),
                      const _ContactButton(fullWidth: true),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  bool _isActive(String route) {
    if (route == RouteManager.initialRoute) {
      return currentRoute == RouteManager.initialRoute ||
          currentRoute == RouteManager.homeRoute;
    }
    return currentRoute == route ||
        (route == RouteManager.postsRoute &&
            currentRoute.startsWith('${RouteManager.postsRoute}/'));
  }

  void _navigate(BuildContext context, String route) {
    if (_isActive(route)) {
      _scrollShellToTop(context);
      return;
    }
    RouteManager.offAll(route);
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _scrollShellToTop(context);
        RouteManager.toInitial();
      },
      borderRadius: BorderRadius.circular(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AssetsManager.logoPath,
            height: isMobile ? 22 : 26,
            colorFilter: const ColorFilter.mode(
              Color(0xFF0F2A2B),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'AINSOFT',
            style: GoogleFonts.spaceGrotesk(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: const Color(0xFF0F2A2B),
            ).copyWith(fontFamilyFallback: appFontFallback),
          ),
        ],
      ),
    );
  }
}

class _AppShellNavItem {
  const _AppShellNavItem({required this.label, required this.route});

  final String label;
  final String route;
}

class _AppShellNavLink extends StatelessWidget {
  const _AppShellNavLink({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          color: active ? const Color(0xFFC86E42) : const Color(0xFF224142),
        ).copyWith(fontFamilyFallback: appFontFallback),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({required this.fullWidth});

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

class _AppShellFooter extends StatelessWidget {
  const _AppShellFooter({
    required this.responsive,
    required this.currentRoute,
  });

  final AppShellResponsive responsive;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: responsive.sectionPadding.copyWith(
        bottom: responsive.isMobile ? 20 : 28,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(responsive.cardPadding),
            decoration: BoxDecoration(
              color: const Color(0xFF0F2A2B),
              borderRadius: BorderRadius.circular(
                responsive.isMobile ? 22 : 28,
              ),
            ),
            child: responsive.isBrowser
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 3, child: _FooterBrandBlock()),
                      SizedBox(width: responsive.gap),
                      Expanded(
                        flex: 2,
                        child: _FooterLinkBlock(currentRoute: currentRoute),
                      ),
                      SizedBox(width: responsive.gap),
                      const Expanded(flex: 2, child: _FooterContactBlock()),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _FooterBrandBlock(),
                      SizedBox(height: 18),
                      _FooterLinkBlock(currentRoute: currentRoute),
                      SizedBox(height: 18),
                      const _FooterContactBlock(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _FooterBrandBlock extends StatelessWidget {
  const _FooterBrandBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AINSOFT',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF7F2EA),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 12),
        Text(
          'AINSOFT는 운영 자동화, 지식검색, 멀티모달 AI 서비스를 연결해 제조와 조선 현장의 문제를 더 현실적인 구조로 해결합니다.',
          style: GoogleFonts.dmSans(
            fontSize: 14,
            height: 1.7,
            color: const Color(0xFFD7E2DC),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 14),
        Text(
          '사업자등록번호 206-29-47109',
          style: GoogleFonts.dmSans(
            fontSize: 13,
            color: const Color(0xFFD7E2DC),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
      ],
    );
  }
}

class _FooterLinkBlock extends StatelessWidget {
  const _FooterLinkBlock({required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final links = <({String label, String route})>[
      (label: 'Home', route: RouteManager.initialRoute),
      (label: 'About', route: RouteManager.aboutRoute),
      (label: 'Products', route: RouteManager.productsRoute),
      (label: 'Solutions', route: RouteManager.solutionsRoute),
      (label: 'Services', route: RouteManager.servicesRoute),
      (label: 'Post', route: RouteManager.postsRoute),
      (label: 'Contact', route: RouteManager.contactRoute),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF7F2EA),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 12),
        for (final link in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => _navigate(context, link.route),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  child: Text(
                    link.label,
                    style: GoogleFonts.dmSans(
                      color: _isActive(link.route)
                          ? const Color(0xFFC86E42)
                          : const Color(0xFFD7E2DC),
                      fontWeight: FontWeight.w600,
                    ).copyWith(fontFamilyFallback: appFontFallback),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  bool _isActive(String route) {
    if (route == RouteManager.initialRoute) {
      return currentRoute == RouteManager.initialRoute ||
          currentRoute == RouteManager.homeRoute;
    }
    return currentRoute == route ||
        (route == RouteManager.postsRoute &&
            currentRoute.startsWith('${RouteManager.postsRoute}/'));
  }

  void _navigate(BuildContext context, String route) {
    if (_isActive(route)) {
      _scrollShellToTop(context);
      return;
    }
    if (route == RouteManager.initialRoute) {
      RouteManager.toInitial();
      return;
    }
    RouteManager.offAll(route);
  }
}

class _FooterContactBlock extends StatelessWidget {
  const _FooterContactBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF7F2EA),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 12),
        Text(
          'admin@ain.ai.kr',
          style: GoogleFonts.dmSans(
            color: const Color(0xFFD7E2DC),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 8),
        Text(
          '+82 10-2146-0818',
          style: GoogleFonts.dmSans(
            color: const Color(0xFFD7E2DC),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
        const SizedBox(height: 8),
        Text(
          '154, Green-ro, Naju-si, Jeollanam-do, Republic of Korea',
          style: GoogleFonts.dmSans(
            color: const Color(0xFFD7E2DC),
          ).copyWith(fontFamilyFallback: appFontFallback),
        ),
      ],
    );
  }
}
