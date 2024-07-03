import 'package:dio/dio.dart';
import 'package:dio/io.dart';


class MarvelDio with DioMixin implements Dio {
  final List<Interceptor> globalInterceptor;

  MarvelDio({
    this.globalInterceptor = const <Interceptor>[],
  }) {
    interceptors.addAll(<Interceptor>[
      
      ...globalInterceptor,
    ]);
  }

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://gateway.marvel.com:443',
      );
  @override
  HttpClientAdapter get httpClientAdapter => IOHttpClientAdapter();
}
