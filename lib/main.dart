import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/constants/app_constants.dart';

import 'route/routes.dart';
import 'services/app_manage.dart';
import 'services/singleton_manage.dart';

void main() async {
  await configSingleton();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final mainNavigatorService = AppManage.mainNavigatorService;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // size taken from Figma
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        // Calculate the scaled text factor using the clamp function to ensure it stays within a specified range.
        final scale = mediaQueryData.textScaler.clamp(
          minScaleFactor: 1.0, // Minimum scale factor allowed.
          maxScaleFactor: 1.0, // Maximum scale factor allowed.
        );
        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaler: scale,
          ),
          child: MaterialApp(
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors
                  .white, // Change this color to your desired background color
              fontFamily: AppConstants.fontFamily,
            ),
            navigatorKey: mainNavigatorService.appNavigatorGlobalKey,
            navigatorObservers: [mainNavigatorService.appRouteObserver],
            onGenerateRoute: AppNavigatorRoutes.requestRoute,
            onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text(
                    'No route ${settings.name}',
                  ),
                ),
              ),
            ),
            initialRoute: ScreenName.homeScreen,
          ),
        );
      },
    );
  }
}
