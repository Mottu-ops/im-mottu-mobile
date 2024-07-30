import 'dart:convert';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/context/home/api/home_api.dart';
import 'package:im_mottu_mobile/context/home/model/banner_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/services/services_cache.dart';

class HomeController extends GetxController {
  bool isLoading = false;
  bool isLoadingComics = false;
  bool tryAgainComics = false;
  bool tryAgainCharacter = false;

  List<CharacterModel> characters = <CharacterModel>[];
  List<ComicsResumeModel> comics = <ComicsResumeModel>[];

  String query = '';

  int offset = 0;
  int currentIndex = 0;

  final List<BannerModel> banners = [
    BannerModel(
        id: 0,
        img: 'assets/images/capitao.jpeg',
        title: 'Capitão américa',
        description: 'Uma descrição show aqui',
        keyPhrase: 'capitain america'),
    BannerModel(
        id: 1011054,
        img: 'assets/images/homem.jpg',
        title: 'Homem Aranha',
        description: 'Uma descrição show aqui',
        keyPhrase: 'spider man'),
    BannerModel(
        id: 1,
        img: 'assets/images/thor.jpg',
        title: 'Thor',
        description: 'Uma descrição show aqui',
        keyPhrase: 'thor'),
  ];

  void fetchCharacters() async {
    isLoading = true;
    tryAgainCharacter = false;
    update();
    try {
      List<CharacterModel> newCharacters = await HomeApi().getCharacters(
        offset: offset,
        query: query,
      );

      characters.addAll(newCharacters);
      offset += 20;
      setCache();
      update();
    } catch (e) {
      tryAgainCharacter = true;
      update();
      Get.snackbar('Error', 'Failed to fetch characters');
    } finally {
      isLoading = false;
      update();
    }
  }

  void fetchComics() async {
    isLoadingComics = true;
    tryAgainComics = false;
    update();
    try {
      List<ComicsResumeModel> newComics = await HomeApi().getComics(
        offset: offset,
        query: query,
      );

      comics.addAll(newComics);
      offset += 20;
      update();
    } catch (e) {
      tryAgainComics = true;
      update();
      Get.snackbar('Error', 'Failed to fetch comics');
    } finally {
      isLoadingComics = false;
      update();
    }
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
    fetchComics();
  }

  @override
  void onClose() {
    super.onClose();
    clearCache();
  }
}
