import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/characters_page.dart';

class CharactersModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
  r.child(
      '/',
      child: (_) => const CharactersPage(),
    );
  }
}