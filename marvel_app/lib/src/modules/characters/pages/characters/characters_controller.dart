import 'package:marvel_app/src/shared/shared.dart';

class CharactersController{

  final CharactersResult result;

  CharactersController({required this.result});

  Future<List<CharacterData>> getCharacters() async {
    return result.data.results;

  }

  CharacterData? lastSelectedCharacter;
}