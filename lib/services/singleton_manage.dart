import 'package:get_it/get_it.dart';
import 'package:movye/route/services.dart';

GetIt singleton = GetIt.instance;

Future configSingleton() async {
  singleton.registerLazySingleton<AppNavigatorServices>(
      () => AppNavigatorServices());
}
