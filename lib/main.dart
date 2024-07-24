import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mottu_marvel/app_wdiget.dart';
import 'package:mottu_marvel/src/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/life_cycle_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await FirebaseClass().initializeFirebase();

  Get.put(LifeCycleController());
  runApp(const AppWidget());
}
