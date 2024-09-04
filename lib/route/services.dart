import 'package:flutter/material.dart';

class AppNavigatorServices {
  // Init
  final GlobalKey<NavigatorState> appNavigatorGlobalKey =
      GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> appRouteObserver = RouteObserver<PageRoute>();

  List<String> routeList = [];
  String get currentRoute => routeList.isNotEmpty ? routeList.last : '';

  Future? pushNamed(String routeName, {dynamic arguments}) {
    if (currentRoute != routeName) {
      routeList.add(routeName);

      return appNavigatorGlobalKey.currentState
          ?.pushNamed(routeName, arguments: arguments)
          .then(
        (value) {
          if (routeList.isNotEmpty) {
            routeList.removeLast();
          }
          return value;
        },
      );
    }
    return null;
  }

  Future<dynamic>? pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    routeList.clear();
    routeList.add(routeName);

    return appNavigatorGlobalKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  void pop([dynamic arguments]) {
    if (appNavigatorGlobalKey.currentState?.canPop() ?? false) {
      return appNavigatorGlobalKey.currentState?.pop(arguments);
    }
  }
}
