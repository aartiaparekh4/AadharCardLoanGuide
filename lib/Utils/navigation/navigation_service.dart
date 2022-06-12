import 'package:flutter/material.dart';

class NavigationService {
  static final globalNavigatorKey = GlobalKey<NavigatorState>();

  /// Returns value from pop if exists.
  /// [clean] is true to remove all back stacks after pushing
  /// [replace] is true to replace the current route by new route
  ///
  /// How to use:
  /// 1. Push:
  /// NavigationService.push(Routes.home);
  /// 2. Push replacement
  /// NavigationService.push(Routes.home, replace: true);
  /// 3. Push replace back stack
  /// NavigationService.push(Routes.home, clean: true);
  /// 4. Push replace remove util
  /// NavigationService.push(Routes.home, replace: true, clean: true);
  ///
  static Future<T?>? push<T extends Object>(String route,
      {dynamic arguments,
      bool replace = false,
      bool clean = false,
      int? port}) async {
    if (clean) {
      return Navigator.of(getNavigatorKey(port: port)!.currentContext!)
          .pushNamedAndRemoveUntil(
        route,
        (_) => false,
        arguments: arguments,
      );
    }

    if (replace) {
      return Navigator.of(getNavigatorKey(port: port)!.currentContext!)
          .pushReplacementNamed(
        route,
        arguments: arguments,
      );
    }
    return Navigator.of(getNavigatorKey(port: port)!.currentContext!).pushNamed(
      route,
      arguments: arguments,
    );
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object>(String route,
      {dynamic arguments, required String oldRoute, int? port}) {
    return Navigator.of(getNavigatorKey(port: port)!.currentContext!)
        .pushNamedAndRemoveUntil(
      route,
      (old) => old.settings.name == oldRoute,
      arguments: arguments,
    );
  }

  static void popUntil<T extends Object>(String route, {int? port}) {
    return Navigator.of(getNavigatorKey(port: port)!.currentContext!).popUntil(
      (r) => r.settings.name == route,
    );
  }

  static void pop({int? port, dynamic data}) {
    if (getNavigatorKey(port: port)!.currentState!.canPop()) {
      getNavigatorKey(port: port)!.currentState!.pop(data);
    }
  }

  static GlobalKey<NavigatorState>? getNavigatorKey({int? port}) {
    return globalNavigatorKey;
  }
}
