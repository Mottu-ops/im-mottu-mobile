import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mottu_marvel/src/storage/storage_service.dart';

class LifeCycleController extends FullLifeCycleController
    with FullLifeCycleMixin {
  final StorageService _storageService = StorageService(GetStorage());

  @override
  void onDetached() {
    _storageService.erase();
  }

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        log("App Resumed");
        break;
      case AppLifecycleState.inactive:
        log("App InActive");
        break;
      case AppLifecycleState.paused:
        log("App Paused");
        break;
      case AppLifecycleState.detached:
        log("App Detached");
        _storageService.erase();
        break;
      case AppLifecycleState.hidden:
        log("Hidden");
        break;
    }
  }
}
