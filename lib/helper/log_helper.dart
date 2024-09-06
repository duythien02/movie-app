import 'dart:developer';

import '../constants/app_constants.dart';

String resetColor = '\x1B[0m';
String blackColor = '\x1B[30m';
String whiteColor = '\x1B[37m';
String redColor = '\x1B[31m';
String greenColor = '\x1B[32m';
String yellowColor = '\x1B[33m';
String blueColor = '\x1B[34m';
String cyanColor = '\x1B[36m';
String magentaColor = '\x1B[35m';
String pinkColor = '\x1B[95m';

class LogHelper {
  static void logCatch({
    e,
    s,
    bool sendSocket = true,
    String tag = 'LogCatch',
  }) {
    if (AppConstants.showLog) {
      log(
        '\n$redColor'
        'tag: $tag'
        '----------------------------------------\n'
        'Error: $e\n'
        'Stack: $s\n'
        '----------------------------------------\n'
        '$resetColor',
      );
    }
  }

  static void logResponse({
    res,
    query,
    bool sendSocket = true,
    String tag = 'logResponse',
  }) {
    if (AppConstants.showLog) {
      log(
        '\n$greenColor'
        'tag: $tag'
        '----------------------------------------\n'
        'query call: $query\n'
        '----------------------------------------\n'
        'Response.body: ${res.body}\n'
        '----------------------------------------\n'
        '$resetColor',
      );
    }
  }

  static void logDetails({
    message,
    String tag = 'logDetails',
  }) {
    if (AppConstants.showLog) {
      log(
        '\n$blueColor'
        'tag: $tag'
        '----------------------------------------\n'
        'Info: $message\n'
        '----------------------------------------\n'
        '$resetColor',
      );
    }
  }

  static void logCheck({
    check,
    bool sendSocket = true,
  }) {
    if (AppConstants.showLog) {
      log(
        '\n$yellowColor'
        '----------------------------------------\n'
        'Check: $check\n'
        '----------------------------------------\n'
        '$resetColor',
      );
    }
  }

  static void logSocketClients({
    message,
    bool sendSocket = true,
  }) {
    if (AppConstants.showLog) {
      log(
        '\n$blueColor'
        '----------------------------------------\n'
        'Socket: $message\n'
        '----------------------------------------\n'
        '$resetColor',
      );
    }
  }
}
