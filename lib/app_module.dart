import 'package:flutter_modular/flutter_modular.dart';

import '/core/bindings/bindings.dart';
import '/core/routing/route_manager.dart';
import '/shared/modules/app_shell/app_shell_page.dart';

/// Every page renders inside [SiteShellPage], which picks the body from the
/// current route.
final appModule = createModule(
  register: (c) {
    c.module(coreModule);

    for (final path in const [
      RouteManager.initialRoute,
      RouteManager.homeRoute,
      RouteManager.aboutRoute,
      RouteManager.productsRoute,
      RouteManager.solutionsRoute,
      RouteManager.servicesRoute,
      RouteManager.postsRoute,
      '${RouteManager.postsRoute}/:slug',
      RouteManager.contactRoute,
    ]) {
      c.route(
        path,
        child: (_, _) => const SiteShellPage(),
        transition: TransitionType.none,
      );
    }
  },
);
