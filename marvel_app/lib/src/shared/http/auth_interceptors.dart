import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';

class AuthInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String ts = DateTime.now().microsecondsSinceEpoch.toString();
    String publicKey = 'd6a68110dec7164fda3b7919062ed0f3';
    String privateKey = '10e23db931581879d9a4fd7e42dd5dd3cb9d8450';
    String hash = CryptoUtils.getHash(
      Uint8List.fromList('$ts$privateKey$publicKey'.codeUnits),
      algorithmName: 'MD5',
    );

    options.queryParameters.addAll({
      'ts': ts,
      'hash': hash.toLowerCase(),
      'apikey': publicKey,
    });

    super.onRequest(options, handler);
  }

}
