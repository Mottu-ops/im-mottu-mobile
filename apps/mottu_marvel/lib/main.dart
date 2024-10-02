import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/router/routes.dart';
import 'package:mottu_marvel/core/routes/app_routes.dart';

import 'core/services/app_lifecycle_service.dart';

void main() async => startApplication();

Future<void> startApplication() async {
  WidgetsFlutterBinding.ensureInitialized();

  setFlavor();
  await dotenv.load();

  print('App flavor $appFlavor');
  print('Environemnt URL ${Environment.baseApiUrl}');
  Get.put(AppLifecycleService());

  await Future.wait([
    lockRotation(),
    getApplicationDirectory(),

    // initFirebase(),
  ]);

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
      initialRoute: CharactersRouteNames.HOME,
      getPages: marvelPages,
    );
  }
}
