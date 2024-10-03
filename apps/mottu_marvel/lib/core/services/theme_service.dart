import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

class ThemeController extends GetxController {
  RxBool isDarkTheme = false.obs;

  void toggleTheme() {
    if (isDarkTheme.value) {
      Get.changeTheme(ThemeData.light().copyWith(extensions: lightThemeExtensions));
      isDarkTheme.value = false;
    } else {
      Get.changeTheme(ThemeData.dark().copyWith(extensions: darkThemeExtensions));
      isDarkTheme.value = true;
    }
  }
}
