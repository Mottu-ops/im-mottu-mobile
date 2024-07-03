import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_module.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_page.dart';

class CharactersModule extends Module {
  @override
  void binds(i) {
    i.addInstance<CharactersController>(
        CharactersController(client: Modular.get()));
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const CharactersPage());
    r.module('/person', module: PersonModule());
  }
}
