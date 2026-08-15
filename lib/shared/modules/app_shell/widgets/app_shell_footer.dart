import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';
import '../app_shell_responsive.dart';

class AppShellFooter extends StatelessWidget {
  const AppShellFooter({
    super.key,
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
                      const Expanded(flex: 3, child: FooterBrandBlock()),
                      SizedBox(width: responsive.gap),
                      Expanded(
                        flex: 2,
                        child: FooterLinkBlock(currentRoute: currentRoute),
                      ),
                      SizedBox(width: responsive.gap),
                      const Expanded(flex: 2, child: FooterContactBlock()),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FooterBrandBlock(),
                      const SizedBox(height: 18),
                      FooterLinkBlock(currentRoute: currentRoute),
                      const SizedBox(height: 18),
                      const FooterContactBlock(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class FooterBrandBlock extends StatelessWidget {
  const FooterBrandBlock({super.key});

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
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'AINSOFT는 운영 자동화, 지식검색, 멀티모달 AI 서비스를 연결해 제조와 조선 현장의 문제를 더 현실적인 구조로 해결합니다.',
          style: GoogleFonts.dmSans(
            fontSize: 14,
            height: 1.7,
            color: const Color(0xFFD7E2DC),
          ),
        ),
      ],
    );
  }
}

class FooterLinkBlock extends StatelessWidget {
  const FooterLinkBlock({super.key, required this.currentRoute});

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
          ),
        ),
        const SizedBox(height: 12),
        for (final link in links)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => _navigate(link.route),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  child: Text(
                    link.label,
                    style: GoogleFonts.dmSans(
                      color: _isActive(link.route)
                          ? const Color(0xFFC86E42)
                          : const Color(0xFFD7E2DC),
                      fontWeight: FontWeight.w600,
                    ),
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

  void _navigate(String route) {
    if (_isActive(route)) return;
    if (route == RouteManager.initialRoute) {
      RouteManager.toInitial();
      return;
    }
    RouteManager.offAll(route);
  }
}

class FooterContactBlock extends StatelessWidget {
  const FooterContactBlock({super.key});

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
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'admin@ain.ai.kr',
          style: GoogleFonts.dmSans(color: const Color(0xFFD7E2DC)),
        ),
        const SizedBox(height: 8),
        Text(
          '+82 10-2146-0818',
          style: GoogleFonts.dmSans(color: const Color(0xFFD7E2DC)),
        ),
        const SizedBox(height: 8),
        Text(
          '154, Green-ro, Naju-si, Jeollanam-do, Republic of Korea',
          style: GoogleFonts.dmSans(color: const Color(0xFFD7E2DC)),
        ),
      ],
    );
  }
}
