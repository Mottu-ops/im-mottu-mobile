import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/api/character_api.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/services/services_cache.dart';

class CharacterController extends GetxController {
  bool isLoading = false;
  bool isLoadingMore = false;
  bool hasMore = true;
  bool tryAgain = false;

  Timer? searchDebounce;

  String query = '';

  int offset = 20;
  int currentIndex = 0;

  List<CharacterModel> characters = <CharacterModel>[];
  final List<String> imagePaths = [
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
    'assets/images/m3.jpg',
  ];

  TextEditingController searchController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  void fetchCharacters({bool loadMore = false}) async {
    if (loadMore) {
      isLoadingMore = true;
    } else {
      isLoading = true;
    }
    update();
    try {
      log(offset);
      List<CharacterModel> newCharacters = await CharacterApi().getCharacters(
        offset: offset,
        query: query,
      );

      if (newCharacters.isEmpty) {
        hasMore = false;
      } else {
        characters.addAll(newCharacters);
        offset += newCharacters.length;
      }

      update();
    } catch (e) {
      tryAgain = true;
      update();
    } finally {
      if (loadMore) {
        isLoadingMore = false;
      } else {
        isLoading = false;
      }
      update();
    }
  }

  void onScrollEnd() {
    if (!isLoadingMore && hasMore) {
      fetchCharacters(loadMore: true);
    }
  }

  void onSearch(String value) {
    if (searchDebounce?.isActive ?? false) searchDebounce!.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 500), () {
      if (value.length > 3) {
        query = value;
        offset = 0;
        characters.clear();
        hasMore = true;
        fetchCharacters();
      } else if (value.isEmpty) {
        readCache().then((cachedCharacters) {
          if (cachedCharacters.isNotEmpty) {
            characters = cachedCharacters;
            update();
          } else {
            fetchCharacters();
          }
        });
      }
    });
  }

  Future<List<CharacterModel>> readCache() async {
    String? cachedData = await CacheService().readCache('character');
    if (cachedData != null) {
      List<dynamic> jsonData = jsonDecode(cachedData);
      return jsonData.map((e) => CharacterModel.fromJson(e)).toList();
    }
    return [];
  }

  void addListner() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onScrollEnd();
      }
    });
  }

  void pageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    addListner();
    readCache().then((cachedCharacters) {
      if (cachedCharacters.isNotEmpty) {
        characters = cachedCharacters;
        update();
      } else {
        fetchCharacters();
      }
    });
  }
}
