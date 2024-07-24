import 'dart:developer';

import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/rest_client/custom_dio.dart';
import 'package:mottu_marvel/src/storage/storage_service.dart';

import './characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CustomDio _dio;
  final FirebaseClass _firebaseClass;
  final StorageService _storageService;

  CharactersRepositoryImpl({
    required CustomDio dio,
    required FirebaseClass firebaseClass,
    required StorageService storageService,
  })  : _dio = dio,
        _firebaseClass = firebaseClass,
        _storageService = storageService;

  @override
  Future<List<AllCharactersResultModel>> getAllCharacters(
      int offset, int limit) async {
    final cacheKey = 'characters_$offset';
    final cachedData = await _storageService.read(cacheKey);
    if (cachedData != null) {
      log('Data fetched from cache for offset: $offset');
      final cachedCharacters = (cachedData as List)
          .map((c) => AllCharactersResultModel.fromMap(c))
          .toList();
      return cachedCharacters;
    }
    try {
      log('Fetching data from API for offset: $offset');
      final result = await _dio.get('/v1/public/characters', queryParameters: {
        'ts': 1,
        'apikey': _firebaseClass.apiKey,
        'hash': _firebaseClass.hash,
        'offset': offset,
        'limit': limit
      });

      final characters = result.data['data']['results']
          .map<AllCharactersResultModel>(
              (c) => AllCharactersResultModel.fromMap(c))
          .toList();
      await _storageService.write(
          cacheKey, characters.map((c) => c.toMap()).toList());

      return characters;
    } catch (e, s) {
      _firebaseClass.recordError(e, s);
      log('Erro ao buscar personagens', error: e, stackTrace: s);
      throw Exception('Failed to fetch characters');
    }
  }

  @override
  Future<List<AllCharactersResultModel>> searchCharacter(String name) async {
    final cacheKey = 'search_character_$name';
    final cachedData = await _storageService.read(cacheKey);
    if (cachedData != null) {
      log('Data fetched from cache for character name: $name');
      final cachedCharacters = (cachedData as List)
          .map((c) => AllCharactersResultModel.fromMap(c))
          .toList();
      return cachedCharacters;
    }
    try {
      log('Searching character from API with name: $name');
      final result = await _dio.get('/v1/public/characters', queryParameters: {
        'ts': 1,
        'apikey': _firebaseClass.apiKey,
        'hash': _firebaseClass.hash,
        'name': name
      });

      final character = result.data['data']['results']
          .map<AllCharactersResultModel>(
              (c) => AllCharactersResultModel.fromMap(c))
          .toList();
      await _storageService.write(
          cacheKey, character.map((c) => c.toMap()).toList());

      return character;
    } catch (e, s) {
      _firebaseClass.recordError(e, s);
      log('Erro ao buscar personagem por nome', error: e, stackTrace: s);
      throw Exception('Failed to fetch character by name');
    }
  }

  @override
  Future<List<AllCharactersResultModel>> getCharactersByFilter(
    String? comics,
    String? series,
    String? stories,
    String? events,
  ) async {
    final filterParams = {
      'comics': comics,
      'series': series,
      'stories': stories,
      'events': events,
    }..removeWhere((key, value) => value == null || value.isEmpty);
    final cacheKey =
        'characters_filter_${filterParams.entries.map((e) => '${e.key}_${e.value}').join('_')}';

    final cachedData = await _storageService.read(cacheKey);
    if (cachedData != null) {
      log('Data fetched from cache for filters: $filterParams');
      final cachedCharacters = (cachedData as List)
          .map((c) => AllCharactersResultModel.fromMap(c))
          .toList();
      return cachedCharacters;
    }
    try {
      log('Fetching characters from API with filters: $filterParams');
      final result = await _dio.get('/v1/public/characters', queryParameters: {
        'ts': 1,
        'apikey': _firebaseClass.apiKey,
        'hash': _firebaseClass.hash,
        ...filterParams,
      });

      final characters = result.data['data']['results']
          .map<AllCharactersResultModel>(
              (c) => AllCharactersResultModel.fromMap(c))
          .toList();
      await _storageService.write(
          cacheKey, characters.map((c) => c.toMap()).toList());

      return characters;
    } catch (e, s) {
      _firebaseClass.recordError(e, s);
      log('Erro ao buscar personagens com filtros', error: e, stackTrace: s);
      throw Exception('Failed to fetch characters with filters');
    }
  }
}
