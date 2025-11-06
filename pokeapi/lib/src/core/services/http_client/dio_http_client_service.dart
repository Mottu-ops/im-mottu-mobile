import 'package:dio/dio.dart';
import 'package:pokeapi/src/core/services/http_client/http_exception.dart';

import 'http_client_service.dart';

class DioHttpClientService implements HttpClientService {
  final Dio _dio;

  DioHttpClientService({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: connectTimeout,
           receiveTimeout: receiveTimeout,
         ),
       );

  @override
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw HttpConnectionException();
      }

      if (e.response?.statusCode == 404) {
        throw HttpNotFoundException(
          message: e.message,
          stackTrace: e.stackTrace,
        );
      }

      throw HttpUnexpectedException(
        statusCode: e.response?.statusCode,
        message: e.message,
        stackTrace: e.stackTrace,
      );
    } catch (e) {
      rethrow;
    }
  }
}
