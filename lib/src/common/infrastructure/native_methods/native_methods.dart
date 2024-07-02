import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class NativeMethods {
  static const _platform = MethodChannel('com.mottu.marvel/connectivity');
  static String _connectivityStatus = 'Unknown';

  static Future<void> startConnectivityListener() async {
    try {
      await _platform.invokeMethod('startConnectivityListener');
      _platform.setMethodCallHandler((call) async {
        if (call.method == 'updateConnectivityStatus') {
          _connectivityStatus = call.arguments;
          if (_connectivityStatus == 'offline') {
            _showOfflineSnackbar();
          }
        }
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to start connectivity listener: '${e.message}'.");
    }
  }

  static void _showOfflineSnackbar() {
    Get.showSnackbar(const GetSnackBar(
      title: 'No Internet Connection',
      message: 'Please check your internet connection and try again.',
      duration: Duration(seconds: 10),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    ));
  }
}
