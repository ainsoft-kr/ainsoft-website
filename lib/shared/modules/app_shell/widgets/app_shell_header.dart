import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';
import '/shared/design/app_font_config.dart';
import '/shared/design/design.dart';
import '../app_shell_responsive.dart';
import 'contact_button.dart';

void _scrollShellToTop(BuildContext context) {
  final controller = PrimaryScrollController.maybeOf(context);
  if (controller == null || !controller.hasClients) return;
  controller.jumpTo(0);
}

class AppShellHeader extends StatelessWidget {
  const AppShellHeader({super.key, required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final responsive = AppShellResponsive.of(context);
    final items = <AppShellNavItem>[
      const AppShellNavItem(label: 'Home', route: RouteManager.initialRoute),
      const AppShellNavItem(label: 'About', route: RouteManager.aboutRoute),
      const AppShellNavItem(
        label: 'Products',
        route: RouteManager.productsRoute,
      ),
      const AppShellNavItem(
        label: 'Solutions',
        route: RouteManager.solutionsRoute,
      ),
      const AppShellNavItem(
        label: 'Services',
        route: RouteManager.servicesRoute,
      ),
      const AppShellNavItem(
        label: 'Post',
        route: RouteManager.postsRoute,
      ),
      const AppShellNavItem(
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
                      const BrandMark(isMobile: false),
                      const Spacer(),
                      for (final item in items)
                        AppShellNavLink(
                          label: item.label,
                          active: _isActive(item.route),
                          onTap: () => _navigate(context, item.route),
                        ),
                      const SizedBox(width: 10),
                      const ContactButton(fullWidth: false),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          BrandMark(isMobile: responsive.isMobile),
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
                      const ContactButton(fullWidth: true),
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

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, required this.isMobile});

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

class AppShellNavItem {
  const AppShellNavItem({required this.label, required this.route});

  final String label;
  final String route;
}

class AppShellNavLink extends StatelessWidget {
  const AppShellNavLink({
    super.key,
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
