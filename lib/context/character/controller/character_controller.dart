import 'dart:convert';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/api/character_api.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/services/services_cache.dart';

class CharacterController extends GetxController {
  bool isLoading = false;

  List<CharacterModel> characters = <CharacterModel>[];

  String query = '';

  int offset = 0;
  int currentIndex = 0;

  final List<String> imagePaths = [
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
    'assets/images/m3.jpg',
  ];

  void fetchCharacters() async {
    isLoading = true;
    update();
    try {
      List<CharacterModel> newCharacters = await CharacterApi().getCharacters(
        offset: offset,
        query: query,
      );

      characters.addAll(newCharacters);
      offset += 20;
      setCache();
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch characters');
    } finally {
      isLoading = false;
      update();
    }
  }

  void onScrollEnd() {
    fetchCharacters();
  }

  void onSearch(String value) {
    query = value;
    offset = 0;
    characters.clear();
    fetchCharacters();
  }

  Future<void> setCache() async {
    await CacheService().writeCache('character', jsonEncode(characters));
  }

  Future<List<CharacterModel>> readCache() async {
    String? cachedData = await CacheService().readCache('character');
    if (cachedData != null) {
      List<dynamic> jsonData = jsonDecode(cachedData);
      return jsonData.map((e) => CharacterModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<void> clearCache() async {
    await CacheService().clearCache();
  }

  pageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readCache().then((cachedCharacters) {
      if (cachedCharacters.isNotEmpty) {
        characters = cachedCharacters;
        update();
      } else {
        fetchCharacters();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    clearCache();
  }
}
