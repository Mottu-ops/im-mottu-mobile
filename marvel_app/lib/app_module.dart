import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/characters_module.dart';
import 'package:marvel_app/src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
   
    r.module('/characters', module: CharactersModule());
  }
}
