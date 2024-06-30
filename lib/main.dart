import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:marvel_app/marvel_app.dart';
import 'package:marvel_app/src/common/configs.dart';
import 'package:marvel_app/src/common/infrastructure/http/dio_http_adapter.dart';

void dependencies() {
  Get.put(DioHttpAdapter(baseUrl: AppConfigs.baseUrl));
}

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    dependencies();
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const MarvelApp());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
