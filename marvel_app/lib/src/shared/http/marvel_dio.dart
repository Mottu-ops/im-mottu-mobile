import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class MarvelDio with DioMixin implements Dio {
  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://gateway.marvel.com:443',
        queryParameters: {
          'apikey': 'd6a68110dec7164fda3b7919062ed0f3',
          'ts': 'YOUR_TIMESTAMP',
          'hash': 'YOUR_HASH',
        },
      );
@override
  HttpClientAdapter get  httpClientAdapter => IOHttpClientAdapter();
  
}
