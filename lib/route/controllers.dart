import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../services/app_manage.dart';

class AppNavigatorControllers {
  static BuildContext? currentContext() =>
      AppManage.mainNavigatorService.appNavigatorGlobalKey.currentContext;
  static void backPreScreen([dynamic arguments]) =>
      AppManage.mainNavigatorService.pop(arguments);
  static Future? moveToMainHome() {
    return AppManage.mainNavigatorService.pushNamedAndRemoveUntil(
      ScreenName.homeScreen,
    );
  }

  static Future? moveToSearchScreen({required String keyWord}) {
    return AppManage.mainNavigatorService.pushNamedAndRemoveUntil(
      ScreenName.searchScreen,
      arguments: keyWord,
    );
  }
}
