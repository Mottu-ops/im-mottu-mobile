import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/src/home/models/hero_dto.dart';
import 'package:marvel_app/src/home/models/params_dto.dart';
import 'package:marvel_app/src/home/repositories/characters_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterController extends GetxController {
  final CharactersRepository charactersRepository;
  CharacterController(this.charactersRepository);

  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final isError = false.obs;
  final heroes = <HeroDto>[].obs;
  final offset = 0.obs;
  var params = ParamsDto(limit: 10);
  final searchTextController = TextEditingController();

  @override
  void onInit() async {
    await loadCachedHeroes();
    super.onInit();
  }

  Future<void> loadCachedHeroes() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final cachedHeroes = prefs.getStringList('cachedHeroes');
      final cachedOffset = prefs.getInt('cachedOffset') ?? 0;

      if (cachedHeroes?.isNotEmpty ?? false) {
        heroes.value = cachedHeroes?.map((e) => HeroDto.fromJson(jsonDecode(e))).toList() ?? [];
        offset.value = cachedOffset;
        heroes.refresh();
      } else {
        await getHeroes();
      }
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cacheHeroes() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = heroes.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('cachedHeroes', encoded);
    await prefs.setInt('cachedOffset', offset.value);
  }

  Future<void> getHeroes() async {
    try {
      isLoading.value = true;
      isError.value = false;
      heroes.clear();
      offset.value = 0;
      params = params.copyWith(offset: offset.value);
      final newHeroes = await charactersRepository.getHeroes(params: params);
      heroes.value = newHeroes;
      await cacheHeroes();
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreHeroes() async {
    if (isLoadingMore.value || isLoading.value) return;
    try {
      isLoadingMore.value = true;
      offset.value += params.limit!;
      params = params.copyWith(offset: offset.value);
      final newHeroes = await charactersRepository.getHeroes(params: params);
      if (newHeroes.isNotEmpty) {
        heroes.addAll(newHeroes);
        await cacheHeroes();
      }
    } finally {
      isLoadingMore.value = false;
    }
  }

  void updateSearchQuery(String query) {
    params = params.copyWith(nameStartsWith: query);
    getHeroes();
  }

  @override
  void onClose() {
    clearCache();
    super.onClose();
  }

  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cachedHeroes');
    await prefs.remove('cachedOffset');
  }
}
