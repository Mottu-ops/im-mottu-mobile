import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

class FilterCharactersStartswithUsecase extends FilterCharactersUsecase {
  @override
  List<MarvelCharacter> call({FilterCharactersUsecaseParam? param}) {
    if (param == null) {
      return <MarvelCharacter>[];
    }

    return param.initialList.where((eachCharacter) => eachCharacter.name.startsWith(param.prefix)).toList();
  }
}
