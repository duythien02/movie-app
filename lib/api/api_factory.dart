import 'package:http/http.dart' as http;
import 'package:movye/constants/app_constants.dart';
import 'package:movye/helper/api_helper.dart';

import '../helper/log_helper.dart';

class ApiFactory {
  ApiFactory._privateConstructor();
  static final ApiFactory apiInstance = ApiFactory._privateConstructor();
  final _httpClient = http.Client();

  Future<http.Response?> get(String appApiAdress,
      [Map<String, dynamic>? getparams]) async {
    try {
      String transformedParams = ApiHelper.getParamsFromMap(getparams ?? {});

      Uri url =
          Uri.parse(AppConstants.apiUrl + appApiAdress + transformedParams);

      final res = await _httpClient.get(url);
      LogHelper.logResponse(res: res, query: url, tag: 'Get api result');

      return res;
    } catch (e) {
      LogHelper.logCatch(tag: 'Error when get data', e: e);
      if (e
          .toString()
          .contains('Connection closed before full header was received')) {
        await Future.delayed(const Duration(seconds: 2));
        return get(appApiAdress, getparams);
      }
      return null;
    }
  }
}
