import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/shared.dart';

class PersonController{

  final CharactersController charactersController;

  PersonController({required this.charactersController});

 CharacterData getCharacterLocal()  {
    return charactersController.lastSelectedCharacter!;

  }

    Future<CharacterData> getCharacterInfoPlus() async {
    return charactersController.lastSelectedCharacter!;

  }

  CharacterData? lastSelectedCharacter;
}