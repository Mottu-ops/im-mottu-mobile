import 'package:common/common.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'configs/firebase_options_staging.dart' as firebase_options_staging;

Future<void> initFirebase() async {
  print('starting firebase for flavor $flavor');
  await Firebase.initializeApp(
    options: () {
      switch (flavor) {
        case Flavor.dev:
          break; //TODO
        case Flavor.staging:
          return firebase_options_staging.DefaultFirebaseOptions.currentPlatform;
        case Flavor.prod:
          break; //TODO
        default:
          throw StateError('there is no firebase options for flavor $flavor');
      }
    }(),
  );

  startCrashlytics();
}

const fatalError = true; //can be available in firebase remote config
void startCrashlytics() {
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    } else {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    } else {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
}
