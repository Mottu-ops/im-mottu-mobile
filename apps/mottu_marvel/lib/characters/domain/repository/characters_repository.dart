import 'package:mottu_marvel/characters/data/models/marvel_response_model.dart';

abstract class CharactersRepository {
  Future<MarvelResponse> fetchCharacters({int limit = 10, required int offset});
  Future<MarvelResponse> filterCharactersByName({String name, int limit = 10, required int offset});
  Future<MarvelResponse> relatedCharacters({int id, int limit = 10, required int offset});
}
