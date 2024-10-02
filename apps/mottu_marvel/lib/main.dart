import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/core/routes/app_routes.dart';

import 'modules/splash/presentation/routes/routes.dart';

void main() async => startApplication();

Future<void> startApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MottuMarvelApp());
}

class MottuMarvelApp extends StatelessWidget {
  const MottuMarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mottu - Marvel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashRouteNames.SPLASH,
      getPages: marvelPages,
    );
  }
}
