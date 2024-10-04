import 'package:analytics/analytics.dart';
import 'package:dio/dio.dart';
import 'package:persistence/persistence.dart';

class DioCacheInterceptor extends Interceptor {
  DioCacheInterceptor({required this.persistence, required this.analytics});

  final KeyValuePersistence persistence;
  final AnalyticsService analytics;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.method.toUpperCase() != 'GET') {
      return super.onRequest(options, handler);
    }

    final cacheData = await _getCacheData(options.uri, options.uri.queryParameters);
    if (cacheData != null) {
      final cacheTTL = DateTime.now().difference(DateTime.parse(cacheData['timestamp'])).inMinutes;
      analytics.logEvent('cache', properties: {'cacheTTL': cacheTTL});
      //TODO Cache TTL to Firebase remote config or ENV
      if (cacheTTL < 60) {
        final cachedResponse = Response(
            requestOptions: options,
            data: cacheData['data'].cast<String, dynamic>(),
            statusCode: 200,
            statusMessage: 'OK');

        return handler.resolve(cachedResponse);
      } else {
        if (cacheData['etag'] != null) {
          options.headers['If-None-Match'] = cacheData['etag'];
          analytics.logEvent('cache', properties: {'etag': cacheData['etag']});
        }
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 304) {
      final cacheData = await _getCacheData(response.realUri, response.realUri.queryParameters);
      if (cacheData != null) {
        final cachedResponse = Response(
            requestOptions: response.requestOptions,
            data: cacheData['data'] as Map<String, dynamic>,
            statusCode: 200,
            statusMessage: 'OK');
        return handler.resolve(cachedResponse);
      }
    }

    if (response.statusCode == 200 && response.data['etag'] != null) {
      final cacheKey = _generateCacheKey(response.realUri, response.realUri.queryParameters);
      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'etag': response.data['etag'],
        'data': response.data,
      };

      await persistence.save<Map<String, dynamic>>(cacheKey, cacheData);
    }

    return super.onResponse(response, handler);
  }

  Future<Map<String, dynamic>?> _getCacheData(Uri uri, Map<String, dynamic> queryParameters) async {
    final key = _generateCacheKey(uri, queryParameters);
    final cached = await persistence.read<Map<String, dynamic>>(key);
    return cached ?? null;
  }

  String _generateCacheKey(Uri uri, Map<String, dynamic> queryParameters) {
    final key = queryParameters.entries.map((entry) {
      if (entry.key == 'ts' || entry.key == 'apiKey' || entry.key == 'hash') {
        return "";
      }

      return entry.value;
    }).join(",");

    return key;
  }
}
