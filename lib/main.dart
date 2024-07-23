import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mottu_marvel/src/application/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/application/pages/characters/characters_module.dart';
import 'package:mottu_marvel/src/application/ui/app_ui_config.dart';
import 'package:mottu_marvel/src/life_cycle_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final firebaseClass = FirebaseClass();
  await Future.wait([
    firebaseClass.initializeFirebase(),
  ]);
  Get.put(LifeCycleController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppUiConfig.title,
      theme: AppUiConfig.theme,
      getPages: [
        ...CharactersModule().routers,
      ],
    );
  }
}
