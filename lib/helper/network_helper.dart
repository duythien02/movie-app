import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_constants.dart';

class NetworkHelper {
  static Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else {
      return false;
    }
  }

  static void showToast() {
    Fluttertoast.showToast(
      msg: StringConstants.noInternet,
      gravity: ToastGravity.CENTER,
      backgroundColor: const Color(ColorConstants.primaryOrange),
      timeInSecForIosWeb: 2,
    );
  }
}
