import 'package:flutter_modular/flutter_modular.dart';

class RouteManager {
  RouteManager._();

  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String aboutRoute = '/about';
  static const String productsRoute = '/products';
  static const String solutionsRoute = '/solutions';
  static const String contactRoute = '/contact';
  static const String authRoute = '/auth';
  static const String registerRoute = '/auth/register';
  static const String menuRoute = '/menu';

  static Future<T?>? to<T>(String route, {dynamic arguments}) {
    return Modular.to.pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?>? off<T>(String route, {dynamic arguments}) {
    return Modular.to.pushReplacementNamed<T, dynamic>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? offAll<T>(String route, {dynamic arguments}) {
    Modular.to.navigate(route, arguments: arguments);
    return null;
  }

  static void back<T>({T? result}) {
    if (result == null) {
      Modular.to.pop();
      return;
    }
    Modular.to.pop<T>(result);
  }

  static Future<T?>? until<T>(String route, {dynamic arguments}) {
    Modular.to.navigate(route, arguments: arguments);
    return null;
  }

  static Future<dynamic>? toAuth() => to(authRoute);
  static Future<dynamic>? toRegister() => to(registerRoute);
  static Future<dynamic>? toMenu() => to(menuRoute);
  static Future<dynamic>? toInitial() => offAll(initialRoute);
  static Future<dynamic>? toHome() => to(homeRoute);
  static Future<dynamic>? toAbout() => to(aboutRoute);
  static Future<dynamic>? toProducts() => to(productsRoute);
  static Future<dynamic>? toSolutions() => to(solutionsRoute);
  static Future<dynamic>? toContact() => to(contactRoute);
  static Future<dynamic>? logout() => offAll(authRoute);
  static Future<dynamic>? loginSuccess() => offAll(menuRoute);

  static String get currentRoute => _normalizePath(Modular.to.path);

  static bool isCurrentRoute(String route) {
    return currentRoute == _normalizePath(route);
  }

  static dynamic get arguments => Modular.args.data;

  static String _normalizePath(String path) {
    final normalized = Uri.parse(path).path;
    if (normalized.length > 1 && normalized.endsWith('/')) {
      return normalized.substring(0, normalized.length - 1);
    }
    return normalized;
  }
}
