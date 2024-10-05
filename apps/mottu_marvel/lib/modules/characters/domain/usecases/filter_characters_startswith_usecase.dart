import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

class FilterCharactersStartswithUsecase extends FilterCharactersUsecase {
  FilterCharactersStartswithUsecase({required this.initialList});

  final List<MarvelCharacter> initialList;

  @override
  List<MarvelCharacter> call({String? param}) {
    if (param == null) {
      return <MarvelCharacter>[];
    }

    return initialList
        .where((eachCharacter) => eachCharacter.name.toLowerCase().startsWith(param.toLowerCase()))
        .toList();
  }
}
