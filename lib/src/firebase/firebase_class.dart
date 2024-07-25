import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mottu_marvel/firebase_options.dart';

class FirebaseClass {
  static final FirebaseClass _instance = FirebaseClass._internal();

  factory FirebaseClass() => _instance;

  FirebaseClass._internal();

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await Future.wait([
      FirebaseRemoteConfig.instance.fetchAndActivate(),
      _initializeCrashlytics(),
    ]);
  }

  Future<void> _initializeCrashlytics() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  void log(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  void recordError(dynamic error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  void setUserId(String userId) {
    FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }

  String get apiKey => FirebaseRemoteConfig.instance.getString('apikey');
  String get hash => FirebaseRemoteConfig.instance.getString('hash');
}
