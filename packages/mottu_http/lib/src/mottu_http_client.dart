import 'dart:async';

class ApiResponse {
  ApiResponse({required this.statusCode, this.data});

  int? statusCode;
  Map<String, dynamic>? data;
}

abstract class MottuHttpClient<R extends ApiResponse> {
  Future<R> get(String url, {Map<String, dynamic> queryParameters});
  Future<R> post(String url, Map<String, dynamic> data, {Map<String, dynamic> queryParameters});
  Future<R> put(String url, Map<String, dynamic> data, {Map<String, dynamic> queryParameters});
  Future<R> delete(String url, {Map<String, dynamic> data, Map<String, dynamic> queryParameters});
}
