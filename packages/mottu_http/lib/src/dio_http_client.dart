import 'dart:convert';

import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'mottu_http_client.dart';

class DioHttpClient implements MottuHttpClient<ApiResponse> {
  DioHttpClient(this.client);

  final Dio client;

  @override
  Future<ApiResponse> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      print('GETTING $url ');
      final response = await client.get<Map<String, dynamic>>(url, queryParameters: queryParameters ?? {});
      print(response.data);
      return ApiResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      print(e);
      throw MottuHttpException(
        data: e.response?.data as Map<String, dynamic>,
        httpErrorMessage: e.response?.statusMessage ?? unexpectedErrorMessage,
        code: e.response?.statusCode ?? unexpectedErrorCode,
      );
    }
  }

  @override
  Future<ApiResponse> post(String url, Map<String, dynamic> data, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
      return ApiResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (e) {
      print(e.response?.data);
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
  Future<ApiResponse> put(String url, Map<String, dynamic> data, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.put<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
    return ApiResponse(statusCode: response.statusCode, data: response.data);
  }

  @override
  Future<ApiResponse> delete(String url, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) async {
    final response = await client.delete<Map<String, dynamic>>(url, data: data, queryParameters: queryParameters);
    return ApiResponse(statusCode: response.statusCode, data: response.data);
  }
}
