import 'dart:developer';

import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/ui/loader/loader_mixin.dart';
import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/services/characters/characters_service.dart';

class CharactersController extends GetxController
    with StateMixin<List<AllCharactersResultModel>>, LoaderMixin {
  late final Worker workerPage;

  final _offset = 0.obs;
  final _limit = 5;
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

    //getAllCharacters();
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
}
