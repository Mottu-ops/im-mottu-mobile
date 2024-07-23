import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(BaseOptions(
          baseUrl: 'https://gateway.marvel.com:443',
          connectTimeout: const Duration(
            milliseconds: 5000,
          ),
          receiveTimeout: const Duration(
            milliseconds: 120000,
          ),
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
