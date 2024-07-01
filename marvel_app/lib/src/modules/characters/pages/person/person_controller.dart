import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';

class PersonController{

  final CharactersController charactersController;

  PersonController({required this.charactersController});

 Future <CharacterData> getCharacterLocal(String id)  async {
    return (await charactersController.getCharacters()).firstWhere((p) => '${p.id}' == id);

  }

    Future<CharacterData> getCharacterInfoPlus() async {
    return charactersController.lastSelectedCharacter!;

  }

  CharacterData? lastSelectedCharacter;
}