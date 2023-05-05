import 'package:flutter/material.dart';

class DetailsController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  Future<bool> loader() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;

    if (inLoader.value == false) {
      return true;
    }
    return false;
  }
}
