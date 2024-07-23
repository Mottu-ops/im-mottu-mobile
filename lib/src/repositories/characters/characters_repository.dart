import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';

abstract class CharactersRepository {
  Future<List<AllCharactersResultModel>> getAllCharacters(
      int offset, int limit);
}
