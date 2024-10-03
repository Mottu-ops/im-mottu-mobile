import 'package:analytics/src/analytics_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AnalyticsFirebaseService implements AnalyticsService {
  @override
  void identifyUser(String userId, [Map<String, dynamic>? userProperties]) =>
      FirebaseCrashlytics.instance.setUserIdentifier(userId);

  @override
  void logError(error, {required Map<String, dynamic> properties}) {
    logEvent('Error - $error', properties: properties);
  }

  @override
  void logEvent(String eventName, {required Map<String, dynamic> properties}) {
    FirebaseCrashlytics.instance.log('Event: $eventName ${properties.entries.join(",")}');
  }
}
