import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/repositories/characters/characters_repository.dart';

import './characters_service.dart';

class CharactersServiceImpl implements CharactersService {
  final CharactersRepository _charactersRepository;

  CharactersServiceImpl({required CharactersRepository charactersRepository})
      : _charactersRepository = charactersRepository;
  @override
  Future<List<AllCharactersResultModel>> getAllCharacters(
          int offset, int limit) =>
      _charactersRepository.getAllCharacters(offset, limit);

  @override
  Future<List<AllCharactersResultModel>> searchCharacter(String name) =>
      _charactersRepository.searchCharacter(name);

  @override
  Future<List<AllCharactersResultModel>> getCharactersByFilter(
      String comic, String series, String stories, String events) {
    return _charactersRepository.getCharactersByFilter(
      comic,
      series,
      stories,
      events,
    );
  }
}
