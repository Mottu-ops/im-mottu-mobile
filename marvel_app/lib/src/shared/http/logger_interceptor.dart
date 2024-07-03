import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('[HTTP][REQUEST][${options.method}] ${options.path}?${options.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('[HTTP][RESPOSE][${response.requestOptions.method}] [${response.statusCode} - ${response.data['HttpStatus']}] ${response.requestOptions.path}?${response.requestOptions.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('''
[HTTP][ERROR][${err.requestOptions.method}] [${err.response?.statusCode}] ${err.requestOptions.path}?${err.requestOptions.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}
BODY: ${err.response?.data}
ERROR: ${err.message}
''');
// ${err.error}
// ${err.stackTrace}

    super.onError(err, handler);
  }
}
