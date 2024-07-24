import 'dart:developer';

import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/application/ui/loader/loader_mixin.dart';
import 'package:mottu_marvel/src/services/characters/characters_service.dart';

class CharactersController extends GetxController
    with StateMixin<List<AllCharactersResultModel>>, LoaderMixin {
  late final Worker workerPage;

  final _offset = 0.obs;
  final _limit = 10;
  final RxString search = ''.obs;
  final loading = false.obs;

  final CharactersService _charactersService;

  CharactersController({required CharactersService charactersService})
      : _charactersService = charactersService;

  final allCharacters = <AllCharactersResultModel>[].obs;
  final relatedCharacters = <AllCharactersResultModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loaderListener(loading);
    workerPage = ever<int>(_offset, (_) {
      getAllCharacters();
    });
  }

  @override
  void onReady() {
    getAllCharacters();
    super.onReady();
  }

  Future<void> onEndScroll() async {
    _offset.value++;
  }

  Future<void> onTopScroll() {
    throw UnimplementedError();
  }

  Future<void> getAllCharacters() async {
    try {
      loading(true);

      final result =
          await _charactersService.getAllCharacters(_offset.value, _limit);
      if (result.isNotEmpty) {
        allCharacters.addAll(result);
      }
    } catch (e, s) {
      log('Erro ao buscar personagens: $e', stackTrace: s);
    } finally {
      loading(false);
    }
  }

  Future<void> searchCharacter() async {
    if (search.value.isNotEmpty) {
      try {
        loading(true);
        final result = await _charactersService.searchCharacter(search.value);
        allCharacters.assignAll(result);
      } catch (e, s) {
        log('Erro ao buscar personagens: $e', stackTrace: s);
      } finally {
        loading(false);
      }
    } else {
      log('O campo de busca está vazio.');
    }
  }

  Future<void> resetCharacters() async {
    search.value = '';
    allCharacters.clear();
    await getAllCharacters();
  }

  Future<void> fetchRelatedCharacters(
      AllCharactersResultModel character) async {
    try {
      loading(true);

      var comicsIds = character.comics!.items!
          .map((c) => c.resourceURI?.split('/').last)
          .take(10)
          .join(',');
      var seriesIds = character.series!.items!
          .map((s) => s.resourceURI?.split('/').last)
          .take(10)
          .join(',');
      var storiesIds = character.stories!.items!
          .map((s) => s.resourceURI?.split('/').last)
          .take(10)
          .join(',');
      var eventsIds = character.events!.items!
          .map((e) => e.resourceURI?.split('/').last)
          .take(10)
          .join(',');

      final result = await _charactersService.getCharactersByFilter(
        comicsIds,
        seriesIds,
        storiesIds,
        eventsIds,
      );

      if (result.isNotEmpty) {
        relatedCharacters.assignAll(result);
      } else {
        relatedCharacters.clear();
      }
    } catch (e, s) {
      log('Erro ao buscar personagens relacionados: $e', stackTrace: s);
    } finally {
      loading(false);
    }
  }
}
