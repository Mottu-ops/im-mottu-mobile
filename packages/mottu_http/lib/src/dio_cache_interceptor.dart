import 'package:dio/dio.dart';
import 'package:persistence/persistence.dart';

class DioCacheInterceptor extends Interceptor {
  DioCacheInterceptor({required this.persistence});

  final KeyValuePersistence persistence;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final cacheData = await _getCacheData(options.uri, options.uri.queryParameters);
    if (cacheData != null) {
      if (DateTime.now().difference(DateTime.parse(cacheData['timestamp'])).inMinutes < 60) {
        final cachedResponse = Response(
          requestOptions: options,
          data: cacheData['data'],
          statusCode: 200,
        );

        return handler.resolve(cachedResponse);
      } else {
        options.headers['If-None-Match'] = cacheData['etag'];
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
          data: cacheData['data'],
          statusCode: 200,
        );

        return handler.resolve(cachedResponse);
      }
    }

    if (response.statusCode == 200) {
      final cacheKey = _generateCacheKey(response.realUri, response.realUri.queryParameters);
      final cacheData = {
        'timestamp': DateTime.now().toIso8601String(),
        'etag': response.data['etag'],
        'data': response.data,
      };

      await persistence.save(cacheKey, cacheData);
    }

    return super.onResponse(response, handler);
  }

  Future<Map<String, dynamic>?> _getCacheData(Uri uri, Map<String, dynamic> queryParameters) async {
    final key = _generateCacheKey(uri, queryParameters);
    return await persistence.read(key) as Map<String, dynamic>?;
  }

  String _generateCacheKey(Uri uri, Map<String, dynamic> queryParameters) {
    return '${uri.path}${queryParameters['offset']}${queryParameters['limit']}';
  }
}
