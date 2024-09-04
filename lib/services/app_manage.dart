import '../route/services.dart';
import 'singleton_manage.dart';

class AppManage {
  static AppNavigatorServices get mainNavigatorService =>
      singleton<AppNavigatorServices>();
}
