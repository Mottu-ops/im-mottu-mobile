import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';

class PersonController {
  final CharactersController charactersController;

  PersonController({required this.charactersController});

  Future<CharacterData> getCharacterLocal(String id) async {
    CharacterData? result;
    try {
      result = charactersController.cache.firstWhere((p) => '${p.id}' == id);
    } catch (e) {
      result =
          (await charactersController.getCharacters(id: id, cacheable: false))
              .firstWhere((p) => '${p.id}' == id);
    }

    return result;
  }

  Future<CharacterData> getCharacterInfoPlus() async {
    return charactersController.lastSelectedCharacter!;
  }

  CharacterData? lastSelectedCharacter;
}
