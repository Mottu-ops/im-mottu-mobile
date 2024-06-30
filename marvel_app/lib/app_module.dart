import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(
      '/',
      module:   HomeModule(),
    );
  }
}
