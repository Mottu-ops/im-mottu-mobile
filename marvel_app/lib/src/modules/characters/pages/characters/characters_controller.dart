import 'package:dio/dio.dart';
import 'package:marvel_app/src/shared/http/marvel_dio.dart';
import 'package:marvel_app/src/shared/shared.dart';

class CharactersController {
  final CharactersResult result;

  CharactersController({required this.result});

  Future<List<CharacterData>> getCharacters() async {
    Dio client = MarvelDio();

    Response response = await client.request('/v1/public/characters');
    response.data;

    return result.data.results;
  }

  CharacterData? lastSelectedCharacter;
}
