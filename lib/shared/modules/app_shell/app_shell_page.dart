import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' hide RouteManager;

import '/core/routing/route_manager.dart';
import '/modules/about/views/about_page.dart';
import '/modules/contact/views/contact_page.dart';
import '/modules/home/views/home_page.dart';
import '/modules/products/views/products_page.dart';
import '/modules/posts/views/post_detail_page.dart';
import '/modules/posts/views/posts_page.dart';
import '/modules/services/views/services_page.dart';
import '/modules/solutions/views/solutions_page.dart';
import 'app_shell_layout.dart';

class SiteShellPage extends StatelessWidget {
  const SiteShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Modular.to,
      builder: (context, _) {
        final currentRoute = RouteManager.currentRoute;
        return AppShellLayout(
          currentRoute: currentRoute,
          child: switch (currentRoute) {
            RouteManager.initialRoute || RouteManager.homeRoute => const HomePage(),
            RouteManager.aboutRoute => const AboutPage(),
            RouteManager.productsRoute => const ProductsPage(),
            RouteManager.solutionsRoute => const SolutionsPage(),
            RouteManager.servicesRoute => const ServicesPage(),
            RouteManager.postsRoute => const PostsPage(),
            RouteManager.contactRoute => const ContactPage(),
            _ when currentRoute.startsWith('${RouteManager.postsRoute}/') =>
                PostDetailPage(slug: Modular.args.params['slug'] ?? ''),
            _ => const HomePage(),
          },
        );
      },
    );
  }
}
