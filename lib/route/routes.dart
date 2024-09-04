import 'package:flutter/material.dart';

import '../../../constants/screen_name.dart';
import '../screen/home.dart';
import 'route_animation.dart';

class AppNavigatorRoutes {
  static Route? requestRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScreenName.homeScreen:
        return SwipeRight(page: const HomeScreen());
    }
    return null;
  }
}
