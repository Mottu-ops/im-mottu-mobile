import 'package:mottu_marvel/core/usecase/base_usecase.dart';

import '../../data/models/marvel_response_model.dart';

abstract class FilterCharactersUsecase extends Usecase<List<MarvelCharacter>, String> {}
