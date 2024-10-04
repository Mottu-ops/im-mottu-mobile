import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_trie_usecase.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/filter_characters_usecase.dart';

import '../../data/models/marvel_response_model.dart';

class CharactersPageController extends GetxController {
  static const int DEFAULT_LIMIT = 20;

  final repository = Get.find<CharactersRepository>();
  late FilterCharactersUsecase usecase;

  final marvelResponse = Rxn<MarvelResponse>();
  final charactersList = <MarvelCharacter>[].obs;
  final filteredCharactersList = <MarvelCharacter>[].obs;
  final isFetching = false.obs;
  late final searchTextFieldValue = RxString('');
  late final isError = RxBool(false);

  final searchFieldEditingController = TextEditingController();
  final scrollController = ScrollController(initialScrollOffset: 1.0);

  int offset = 0;

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

    try {
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
    } on MottuHttpException {
      isError.value = true; //ok not reverting for this assessment
    }

    isFetching.value = false;
  }

  void filterCharacters(String prefix) {
    searchTextFieldValue.value = prefix;

    if (prefix.isEmpty) {
      filteredCharactersList.value = charactersList;
      return;
    }

    filteredCharactersList.value = usecase(param: prefix);
  }

  Future<void> filterCharactersRemotely() async {
    isFetching.value = true;
    final fetchedResponse = await repository.filterCharactersByName(name: searchTextFieldValue.value, offset: offset);
    marvelResponse.value = fetchedResponse;
    filteredCharactersList.value = marvelResponse.value!.data.results;
    filteredCharactersList.refresh();
    isFetching.value = false;
  }

  void clearSearchField() {
    searchTextFieldValue.value = '';
    filteredCharactersList.value = charactersList;
    searchFieldEditingController.clear();
  }
}
