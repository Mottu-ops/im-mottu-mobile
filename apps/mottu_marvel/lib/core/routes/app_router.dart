import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
    );
  }
}
