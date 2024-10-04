import 'package:analytics/analytics.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_design_system/mottu_design_system.dart';
import 'package:mottu_marvel/core/di/root_bindins.dart';
import 'package:mottu_marvel/core/routes/app_routes.dart';

import 'core/services/theme_service.dart';
import 'modules/splash/presentation/routes/routes.dart';

void main() async => startApplication();

Future<void> startApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  setFlavor();

  await Future.wait([
    dotenv.load(),
    initFirebase(),
    getApplicationDirectory(),
  ]);

  runApp(const MottuMarvelApp());
}

class MottuMarvelApp extends StatelessWidget {
  const MottuMarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        title: 'Mottu - Marvel',
        themeMode: themeController.isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
        theme: mottuThemeLight,
        darkTheme: mottuThemeDark,
        initialRoute: SplashRouteNames.SPLASH,
        getPages: marvelPages,
      ),
    );
  }
}
