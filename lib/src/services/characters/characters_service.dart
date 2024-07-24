import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_result_model.dart';

abstract interface class CharactersService {
  Future<List<AllCharactersResultModel>> getAllCharacters(
      int offset, int limit);
  Future<List<AllCharactersResultModel>> searchCharacter(String name);
  Future<List<AllCharactersResultModel>> getCharactersByFilter(
    String comic,
    String series,
    String stories,
    String events,
  );
}
