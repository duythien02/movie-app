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
}
