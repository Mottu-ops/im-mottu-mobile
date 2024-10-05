import 'package:analytics/analytics.dart';
import 'package:dio/dio.dart';
import 'package:persistence/persistence.dart';

const CACHE_TTL_IN_MINUTES = 60;

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

      if (cacheTTL < CACHE_TTL_IN_MINUTES) {
        final cachedResponse = Response(
            requestOptions: options,
            data: cacheData['data'].cast<String, dynamic>(),
            statusCode: 200,
            statusMessage: 'OK');

        return handler.resolve(cachedResponse);
      } else {
        final etag = cacheData['etag'] as String?;

        if (etag != null) {
          options.headers['If-None-Match'] = etag;
          analytics.logEvent('cache', properties: {'etag': etag});
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

    final etag = response.data['etag'] as String?;
    if (response.statusCode == 200 && etag != null) {
      final cacheKey = _generateCacheKey(response.realUri, response.realUri.queryParameters);
      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'etag': etag,
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
