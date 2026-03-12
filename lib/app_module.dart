import 'package:flutter_modular/flutter_modular.dart';

import '/core/bindings/bindings.dart';
import '/modules/about/views/about_page.dart';
import '/modules/contact/views/contact_page.dart';
import '/modules/home/views/home_page.dart';
import '/modules/products/views/products_page.dart';
import '/modules/services/views/services_page.dart';
import '/modules/solutions/views/solutions_page.dart';
import '/shared/modules/app_shell/app_shell_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SiteShellPage(),
      transition: TransitionType.noTransition,
      children: [
        ChildRoute(
          '/home',
          child: (_) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/about',
          child: (_) => const AboutPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/products',
          child: (_) => const ProductsPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/solutions',
          child: (_) => const SolutionsPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/services',
          child: (_) => const ServicesPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/contact',
          child: (_) => const ContactPage(),
          transition: TransitionType.noTransition,
        ),
      ],
    );
  }
}
