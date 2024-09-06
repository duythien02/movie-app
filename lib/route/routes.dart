import 'package:flutter/material.dart';
import 'package:movye/screen/search.dart';

import '../constants/app_constants.dart';
import '../screen/home.dart';
import 'route_animation.dart';

class AppNavigatorRoutes {
  static Route? requestRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScreenName.homeScreen:
        return SwipeRight(page: const HomeScreen());
      case ScreenName.searchScreen:
        return SwipeRight(
          page: SearchScreen(
            keyWord: routeSettings.arguments as String,
          ),
        );
    }
    return null;
  }
}
