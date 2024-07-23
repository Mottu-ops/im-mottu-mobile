import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';

abstract class CharactersRepository {
  Future<List<AllCharactersResultModel>> getAllCharacters(
      int offset, int limit);
  Future<List<AllCharactersResultModel>> searchCharacter(String name);
  Future<List<AllCharactersResultModel>> getCharactersByFilter(
      String comics, String series, String stories, String events);
}
