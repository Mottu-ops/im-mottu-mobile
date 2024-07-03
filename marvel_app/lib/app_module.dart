import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/characters_module.dart';
import 'package:marvel_app/src/modules/home/home_module.dart';
import 'package:marvel_app/src/shared/http/auth_interceptors.dart';
import 'package:marvel_app/src/shared/http/logger_interceptor.dart';
import 'package:marvel_app/src/shared/http/marvel_dio.dart';
import 'package:marvel_app/src/shared/http/marvel_http_client.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance<Dio>(
      MarvelDio(
        globalInterceptor: [
          AuthInterceptors(),
          LoggerInterceptor(),
        ],
      ),
    );
    i.addInstance(MarvelHttpClient(dio: i()));
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());

    r.module('/characters', module: CharactersModule());
  }
}
