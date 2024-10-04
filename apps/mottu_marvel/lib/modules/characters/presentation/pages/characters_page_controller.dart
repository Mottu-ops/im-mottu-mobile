import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_trie_usecase.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

import '../../data/models/marvel_response_model.dart';

class CharactersPageController extends GetxController {
  final repository = Get.find<CharactersRepository>();
  final marvelResponse = Rxn<MarvelResponse>();
  RxList<MarvelCharacter> charactersList = <MarvelCharacter>[].obs;
  RxList<MarvelCharacter> filteredCharactersList = <MarvelCharacter>[].obs;
  int offset = 0;
  RxBool isFetching = false.obs;
  static const int DEFAULT_LIMIT = 20;
  late FilterCharactersUsecase usecase;
  final ScrollController scrollController = ScrollController(initialScrollOffset: 1.0);

  @override
  void onInit() {
    super.onInit();

    _addScrollListener();
    fetchCharacters();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        if (filteredCharactersList.isNotEmpty && !isFetching.value) {
          offset = offset + DEFAULT_LIMIT;
          fetchCharacters(offset: offset);
        }
      }
    });
  }

  Future<void> fetchCharacters({int offset = 0, limit = DEFAULT_LIMIT}) async {
    isFetching.value = true;

    final fetchedResponse = await repository.fetchCharacters(offset: offset, limit: limit);
    marvelResponse.value = fetchedResponse;

    if (offset == 0) {
      charactersList.value = marvelResponse.value!.data.results;
    } else {
      charactersList.value = [...charactersList, ...marvelResponse.value!.data.results].obs;
      charactersList.refresh();
    }

    filteredCharactersList.value = charactersList;
    filteredCharactersList.refresh();

    // usecase = FilterCharactersStartswithUsecase(initialList: filteredCharactersList.value!);
    usecase = FilterCharactersTrieUsecase(initialList: filteredCharactersList);
    //TODO Handle error

    isFetching.value = false;
  }

  void filterCharacters(String prefix) {
    if (prefix.isEmpty) {
      filteredCharactersList.value = charactersList;
      return;
    }

    filteredCharactersList.value = usecase(param: prefix);
  }
}
