import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';
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
}
