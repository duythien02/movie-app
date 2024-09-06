import 'package:http/http.dart';

import 'log_helper.dart';

class ApiHelper {
  static String getParamsFromMap(Map<dynamic, dynamic>? queryParams) {
    if (isNull(queryParams)) return '';
    String result = '?';
    for (String key in queryParams!.keys) {
      final value = queryParams[key];
      if (!isNull(value)) {
        final String paramData = '$key=$value';
        if (result != '?') {
          result += '&$paramData';
        } else {
          result += paramData;
        }
      }
    }

    return result;
  }

  static bool isApiResponseSuccess(Response? res) {
    return !isNull(res) && res!.statusCode == 200;
  }

  static bool isNull(dynamic data) {
    return data == null ||
        data == {} ||
        ((data is String || data is Iterable || data is Map) && data.isEmpty) ||
        ((data is Iterable) && data.isEmpty) ||
        areDataEqual(data, 'null') ||
        areDataEqual(data, '');
  }

  static bool areDataEqual(data1, data2) {
    try {
      if (data1 is Map && data2 is Map) {
        return getParamsFromMap(data1) == getParamsFromMap(data2);
      }
    } catch (errors, stackTrace) {
      LogHelper.logCatch(e: errors, s: stackTrace);
    }
    return '$data1' == '$data2';
  }
}
