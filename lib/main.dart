import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mottu_marvel/src/application/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/application/pages/characters/characters_module.dart';
import 'package:mottu_marvel/src/application/ui/app_ui_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseClass = FirebaseClass();
  await Future.wait([
    firebaseClass.initializeFirebase(),
  ]);
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
