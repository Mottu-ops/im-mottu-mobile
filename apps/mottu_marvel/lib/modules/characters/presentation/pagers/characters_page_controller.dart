import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_startswith_usecase.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

import '../../data/models/marvel_response_model.dart';

class CharactersPageController extends GetxController {
  final repository = Get.find<CharactersRepository>();
  final marvelResponse = Rxn<MarvelResponse>();
  final charactersList = Rxn<List<MarvelCharacter>>();
  final filteredCharactersList = Rxn<List<MarvelCharacter>>();
  final usecase = FilterCharactersStartswithUsecase();

  @override
  void onInit() {
    super.onInit();

    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final fetchedResponse = await repository.fetchCharacters(offset: 0);
    marvelResponse.value = fetchedResponse;
    charactersList.value = marvelResponse.value!.data.results;
    filteredCharactersList.value = marvelResponse.value!.data.results;
    //TODO Handle error
  }

  void filterCharacters(String prefix) {
    if (prefix.isEmpty) {
      filteredCharactersList.value = charactersList.value;
      return;
    }

    filteredCharactersList.value =
        usecase(param: FilterCharactersUsecaseParam(initialList: charactersList.value!, prefix: prefix));
  }
}
