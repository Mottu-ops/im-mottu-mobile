import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_module.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_page.dart';
import 'package:marvel_app/src/shared/data/characters_model.dart';
import 'package:marvel_app/src/shared/tools/constants/api_mock_map.dart';

class CharactersModule extends Module {
  @override
  void binds(i) {
    i.addInstance<CharactersResult>(CharactersResult.fromJson(API_MOCK_MAP));
    i.addInstance<CharactersController>(CharactersController(result: i()));
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const CharactersPage());
    r.module('/person', module:PersonModule());
  }
}
