import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/home_page.dart';

class HomeModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
  r.child(
      '/',
      child: (_) => const HomePage(),
    );
  }
}