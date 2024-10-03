abstract class AnalyticsService {
  const AnalyticsService();

  void identifyUser(String userId, [Map<String, dynamic>? userProperties]);

  void logEvent(
    String eventName, {
    required Map<String, dynamic> properties,
  });

  void logError(
    dynamic error, {
    required Map<String, dynamic> properties,
  }) {
    logEvent(
      'error',
      properties: {
        'error': error.toString(),
        ...properties,
      },
    );
  }
}
