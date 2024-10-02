import 'package:mottu_marvel/core/usecase/base_usecase.dart';

import '../../data/models/marvel_response_model.dart';

abstract class GetRelatedCharactersUsecase extends Usecase<Future<MarvelResponse>, MarvelCharacter> {}
