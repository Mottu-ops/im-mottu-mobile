import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/app/core/domain/http_adapters/http_response.dart';
import 'package:pokedex/app/core/domain/http_adapters/i_http_client_adapter.dart';
import 'package:pokedex/app/core/infrastructure/adapters/dio/interceptor/common_interceptor.dart';

import 'dio_errors.dart';

class DioAdapter implements IHttpClientAdapter {
  final Dio dio = Dio();
  final List<InterceptorsWrapper> interceptors = [CommonInterceptor()];

  DioAdapter() {
    dio.options.validateStatus = (status) => status! < 600;
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.connectTimeout = const Duration(seconds: 10);
    if (interceptors.isNotEmpty) dio.interceptors.addAll(interceptors);
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final result = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final response = HttpResponse(
        data: result.data is String ? json.decode(result.data) : result.data,
        statusCode: StatusCodeEnum.fromStatusCode(result.statusCode),
      );
      return response;
    } on DioException catch (e) {
      throw DioClientError(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 500,
        type: DioExceptionType.badResponse,
        message: e.message ?? '',
        requestOptions: e.requestOptions,
        stackTrace: e.stackTrace,
      );
    }
  }
}
