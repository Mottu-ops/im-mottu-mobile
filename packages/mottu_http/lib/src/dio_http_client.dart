import 'dart:convert';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:mottu_http/src/dio_cache_interceptor.dart';

import 'exceptions.dart';
import 'mottu_http_client.dart';

class DioHttpClient implements MottuHttpClient<ApiResponse> {
  DioHttpClient(this.client, {required this.dioCacheInterceptor}) {
    client.interceptors.add(dioCacheInterceptor);
  }

  final Dio client;
  final DioCacheInterceptor dioCacheInterceptor;

  @override
  Future<ApiResponse> get(String url, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? options}) async {
    try {
      final response = await client.get<Map<String, dynamic>>(url,
          queryParameters: queryParameters ?? {}, options: Options(headers: options?['headers']));

      return ApiResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      throw MottuHttpException(
        data: e.response?.data != null ? e.response?.data as Map<String, dynamic> : {'error': 'no network connection'},
        httpErrorMessage: e.response?.statusMessage ?? unexpectedErrorMessage,
        code: e.response?.statusCode ?? unexpectedErrorCode,
      );
    }
  }

  @override
  Future<ApiResponse> post(String url, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? options}) async {
    try {
      final response = await client.post<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
      return ApiResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      late Map<String, dynamic> data;
      if (e.response?.data is String) {
        data = json.decode(e.response?.data as String) as Map<String, dynamic>;
      } else {
        data = e.response?.data as Map<String, dynamic>;
      }

      throw MottuHttpException(
        data: data,
        httpErrorMessage: e.response?.statusMessage ?? unexpectedErrorMessage,
        code: e.response?.statusCode ?? unexpectedErrorCode,
      );
    }
  }

  @override
  Future<ApiResponse> put(String url, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? options}) async {
    final response = await client.put<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
    return ApiResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? options}) async {
    final response = await client.delete<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
    return ApiResponse(statusCode: response.statusCode, data: response.data);
  }
}

final dio = Dio(BaseOptions(
  baseUrl: Environment.baseApiUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  validateStatus: (status) => status != null && (status >= 200 && status < 300 || status == 304),
));
