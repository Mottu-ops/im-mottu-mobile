import 'package:mottu_marvel/core/usecase/base_usecase.dart';

import '../../data/models/marvel_response_model.dart';

abstract class GetRelatedCharactersUsecase
    extends Usecase<Future<MarvelResponse>, GetRelatedCharactersByProgramsUsecaseParam> {}

class GetRelatedCharactersByProgramsUsecaseParam {
  GetRelatedCharactersByProgramsUsecaseParam({required this.character, required this.offset, required this.limit});

  final MarvelCharacter character;
  final int offset;
  final int limit;
}
