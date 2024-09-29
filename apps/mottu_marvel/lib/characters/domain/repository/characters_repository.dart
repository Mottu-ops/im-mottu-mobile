import 'package:mottu_marvel/characters/data/models/marvel_response_model.dart';

abstract class CharactersRepository {
  Future<MarvelResponse> fetchCharacters({int limit = 10, required int offset});
  Future<MarvelResponse> filterCharactersByName({required String name, int limit = 10, required int offset});
  Future<MarvelResponse> fetchRelatedCharacters({required int id, int limit = 10, required int offset});
}
