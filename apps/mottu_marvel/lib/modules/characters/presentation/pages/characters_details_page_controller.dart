import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';
import 'package:mottu_marvel/modules/characters/domain/usecases/get_related_characters_usecase.dart';

import '../../data/models/marvel_response_model.dart';

class CharactersDetailsPageController extends GetxController {
  late Rxn<MarvelCharacter> character;
  final repository = Get.find<CharactersRepository>();
  late GetRelatedCharactersUsecase getRelatedCharactersUsecase;
  final marvelResponse = Rxn<MarvelResponse>();
  RxList<MarvelCharacter> charactersList = <MarvelCharacter>[].obs;
  int offset = 0;
  RxBool isFetching = false.obs;
  static const int DEFAULT_LIMIT = 20;
  final ScrollController scrollController = ScrollController(initialScrollOffset: 1.0);

  @override
  void onInit() {
    super.onInit();
    character = Get.arguments['character'].obs;

    _addScrollListener();
    fetchRelatedCharacters();
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      print(scrollController.offset);
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        if (charactersList.isNotEmpty && !isFetching.value) {
          print('FETCHING PAGINAGION: $offset');
          offset = offset + DEFAULT_LIMIT;
          fetchRelatedCharacters(offset: offset);
        }
      }
    });
  }

  Future<void> fetchRelatedCharacters({int offset = 0, limit = DEFAULT_LIMIT}) async {
    isFetching.value = true;

    final fetchedResponse = await getRelatedCharactersUsecase(param: character.value);
    marvelResponse.value = fetchedResponse;

    if (offset == 0) {
      charactersList.value = marvelResponse.value!.data.results;
    } else {
      charactersList.value = [...charactersList, ...marvelResponse.value!.data.results].obs;
      charactersList.refresh();
    }

    isFetching.value = false;
  }
}
