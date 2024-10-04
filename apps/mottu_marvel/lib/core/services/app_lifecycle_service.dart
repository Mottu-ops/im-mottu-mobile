import 'package:persistence/persistence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLifecycleService extends GetxService with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      print('App is closing - removing cache...');
      final persistence = Get.find<KeyValuePersistence>();
      persistence.deleteAll();
    }
  }
}
