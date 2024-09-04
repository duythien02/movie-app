import 'package:flutter/material.dart';
import 'package:movye/constants/screen_name.dart';

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
}
