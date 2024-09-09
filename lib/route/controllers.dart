import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../services/app_manage.dart';

class AppNavigatorControllers {
  static BuildContext? currentContext() =>
      AppManage.mainNavigatorService.appNavigatorGlobalKey.currentContext;

  static void backPreScreen([dynamic arguments]) =>
      AppManage.mainNavigatorService.pop(arguments);

  static Future? moveToSearchScreen({required String keyWord}) {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.searchScreen,
      arguments: keyWord,
    );
  }

  static Future? moveToNewestFilmScreen() {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.newestFilmScreen,
    );
  }

  static Future? moveToSingleFilmScreen() {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.singleFilmScreen,
    );
  }

  static Future? moveToSeriesFilmScreen() {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.seriesFilmScreen,
    );
  }

  static Future? moveToCartoonScreen() {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.cartoonScreen,
    );
  }

  static Future? moveToTvshowsScreen() {
    return AppManage.mainNavigatorService.pushNamed(
      ScreenName.tvshowsScreen,
    );
  }
}
