import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouteManager {
  RouteManager._();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String aboutRoute = '/about';
  static const String productsRoute = '/products';
  static const String solutionsRoute = '/solutions';
  static const String servicesRoute = '/services';
  static const String postsRoute = '/posts';
  static const String contactRoute = '/contact';
  static const String authRoute = '/auth';
  static const String registerRoute = '/auth/register';
  static const String menuRoute = '/menu';

  /// Handed to `ModularApp` so navigation works without a [BuildContext].
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get _context => navigatorKey.currentContext;

  static Future<T?>? to<T>(String route, {dynamic arguments}) {
    return _context?.pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?>? off<T>(String route, {dynamic arguments}) {
    return _context?.replace<T>(route, arguments: arguments);
  }

  static Future<T?>? offAll<T>(String route, {dynamic arguments}) {
    _context?.navigate(route, arguments: arguments);
    return null;
  }

  static void back<T>({T? result}) {
    _context?.pop<T>(result);
  }

  static Future<T?>? until<T>(String route, {dynamic arguments}) {
    _context?.navigate(route, arguments: arguments);
    return null;
  }

  // Site pages use offAll: in flutter_modular 7 only `navigate` updates the
  // URL and the route the shell renders; a push stays out of both.
  static Future<dynamic>? toAuth() => to(authRoute);
  static Future<dynamic>? toRegister() => to(registerRoute);
  static Future<dynamic>? toMenu() => to(menuRoute);
  static Future<dynamic>? toInitial() => offAll(initialRoute);
  static Future<dynamic>? toHome() => offAll(homeRoute);
  static Future<dynamic>? toAbout() => offAll(aboutRoute);
  static Future<dynamic>? toProducts() => offAll(productsRoute);
  static Future<dynamic>? toSolutions() => offAll(solutionsRoute);
  static Future<dynamic>? toServices() => offAll(servicesRoute);
  static Future<dynamic>? toPosts() => offAll(postsRoute);
  static Future<dynamic>? toPost(String slug) => offAll('$postsRoute/$slug');
  static Future<dynamic>? toContact() => offAll(contactRoute);
  static Future<dynamic>? logout() => offAll(authRoute);
  static Future<dynamic>? loginSuccess() => offAll(menuRoute);

  static String get currentRoute =>
      _normalizePath(_routeState?.uri.path ?? initialRoute);

  static bool isCurrentRoute(String route) {
    return currentRoute == _normalizePath(route);
  }

  static dynamic get arguments => _routeState?.arguments;

  static RouteState? get _routeState => _context?.routeState(listen: false);

  /// The normalized path of [state], for widgets that rebuild on navigation.
  static String pathOf(RouteState state) => _normalizePath(state.uri.path);

  static String _normalizePath(String path) {
    final normalized = path;
    if (normalized.length > 1 && normalized.endsWith('/')) {
      return normalized.substring(0, normalized.length - 1);
    }
    return normalized;
  }
}
