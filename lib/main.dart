import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:marvel_app/firebase_options.dart';
import 'package:marvel_app/src/marvel_app.dart';
import 'package:marvel_app/src/common/configs.dart';
import 'package:marvel_app/src/common/infrastructure/http/dio_http_adapter.dart';
import 'package:marvel_app/src/common/infrastructure/http/http.dart';
import 'package:marvel_app/src/home/controllers/character_controller.dart';
import 'package:marvel_app/src/home/repositories/characters_repository.dart';

void dependenciesInjection() {
  Get.put<HttpClient>(DioHttpAdapter(baseUrl: AppConfigs.baseUrl), permanent: true);
  Get.lazyPut(() => CharactersRepository(Get.find()));
  Get.lazyPut(() => CharacterController(Get.find()));
}

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    dependenciesInjection();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const MarvelApp());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
