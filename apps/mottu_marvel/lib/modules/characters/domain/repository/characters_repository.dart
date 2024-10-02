import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';

abstract class CharactersRepository {
  Future<MarvelResponse> fetchCharacters({int limit = 10, required int offset});
  Future<MarvelResponse> filterCharactersByName({required String name, int limit = 10, required int offset});
  Future<MarvelResponse> fetchRelatedCharacters(
      {List<int>? comics,
      List<int>? series,
      List<int>? events,
      List<int>? stories,
      int limit = 10,
      required int offset});
}
