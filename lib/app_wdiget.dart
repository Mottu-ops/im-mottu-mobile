import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/ui/app_ui_config.dart';
import 'package:mottu_marvel/src/application/views/characters/characters_module.dart';
import 'package:mottu_marvel/src/application/views/splash/splash_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppUiConfig.title,
      theme: AppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...CharactersModule().routers,
      ],
    );
  }
}
