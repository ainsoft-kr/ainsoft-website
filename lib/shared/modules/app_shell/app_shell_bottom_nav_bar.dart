import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/core/routing/route_manager.dart';

class AppShellBottomNavBar extends StatelessWidget {
  const AppShellBottomNavBar({super.key, required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final items = <BottomNavItem>[
      const BottomNavItem(
        label: 'Home',
        route: RouteManager.initialRoute,
        icon: Icons.home_rounded,
      ),
      const BottomNavItem(
        label: 'Products',
        route: RouteManager.productsRoute,
        icon: Icons.grid_view_rounded,
      ),
      const BottomNavItem(
        label: 'Solutions',
        route: RouteManager.solutionsRoute,
        icon: Icons.lightbulb_rounded,
      ),
      const BottomNavItem(
        label: 'Post',
        route: RouteManager.postsRoute,
        icon: Icons.article_rounded,
      ),
      const BottomNavItem(
        label: 'Contact',
        route: RouteManager.contactRoute,
        icon: Icons.mail_rounded,
      ),
    ];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFF0F2A2B).withValues(alpha: 0.08),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x140F2A2B),
              blurRadius: 20,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) {
            final active = _isActive(item.route);
            return Expanded(
              child: InkWell(
                onTap: () => _navigate(item.route),
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: active
                          ? const Color(0xFFC86E42)
                          : const Color(0xFF224142).withValues(alpha: 0.7),
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: GoogleFonts.dmSans(
                        fontSize: 10,
                        fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                        color: active
                            ? const Color(0xFFC86E42)
                            : const Color(0xFF224142).withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
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

  void _navigate(String route) {
    if (_isActive(route)) return;
    RouteManager.offAll(route);
  }
}

class BottomNavItem {
  const BottomNavItem({
    required this.label,
    required this.route,
    required this.icon,
  });

  final String label;
  final String route;
  final IconData icon;
}
