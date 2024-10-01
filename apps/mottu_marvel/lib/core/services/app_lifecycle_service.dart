import 'package:persistence/persistence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLifecycleService extends GetxService with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    print('INITING APP LIFECYCLE');
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

    print('App is closing: ${state}');
    if (state == AppLifecycleState.detached) {
      print('App is closing');
      final persistence = Get.find<KeyValuePersistence>();
      persistence.deleteAll();
    }
  }

  void _handleAppClosing() {
    // Handle app closing logic here (e.g., save data, cancel requests)
    print('App is about to close. Saving data...');
  }
}
