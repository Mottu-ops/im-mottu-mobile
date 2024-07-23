import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:mottu_marvel/src/application/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/rest_client/custom_dio.dart';

import './characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CustomDio _dio;
  final FirebaseClass _firebaseClass;
  final GetStorage _storageService;

  CharactersRepositoryImpl({
    required CustomDio dio,
    required FirebaseClass firebaseClass,
    required GetStorage storageService,
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
      FirebaseClass().recordError(e, s);
      log('Erro ao buscar personagens', error: e, stackTrace: s);
    }

    throw Exception('Failed to fetch characters');
  }

  @override
  Future<List<AllCharactersResultModel>> searchCharacter(String name) async {
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
    return character;
  }

  @override
  Future<List<AllCharactersResultModel>> getCharactersByFilter(
    String? comics,
    String? series,
    String? stories,
    String? events,
  ) async {
    try {
      final filters = <String>[];
      if (comics != null && comics.isNotEmpty) filters.add('comics=$comics');
      if (series != null && series.isNotEmpty) filters.add('series=$series');
      if (stories != null && stories.isNotEmpty) {
        filters.add('stories=$stories');
      }
      if (events != null && events.isNotEmpty) filters.add('events=$events');

      final filterString = filters.isNotEmpty ? '?${filters.join('&')}' : '';
      final url = '/v1/public/characters$filterString';

      final result = await _dio.get(url, queryParameters: {
        'ts': 1,
        'apikey': _firebaseClass.apiKey,
        'hash': _firebaseClass.hash,
      });

      final characters = result.data['data']['results']
          .map<AllCharactersResultModel>(
              (c) => AllCharactersResultModel.fromMap(c))
          .toList();

      return characters;
    } catch (e, s) {
      log('Erro ao buscar personagens com filtros', error: e, stackTrace: s);
      throw Exception('Failed to fetch characters with filters');
    }
  }
}
