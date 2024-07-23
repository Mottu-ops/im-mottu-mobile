import 'dart:developer';

import 'package:mottu_marvel/src/application/firebase/firebase_class.dart';
import 'package:mottu_marvel/src/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/rest_client/custom_dio.dart';

import './characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  final CustomDio _dio;
  final FirebaseClass _firebaseClass;

  CharactersRepositoryImpl(
      {required CustomDio dio, required FirebaseClass firebaseClass})
      : _dio = dio,
        _firebaseClass = firebaseClass;

  @override
  Future<List<AllCharactersResultModel>> getAllCharacters(
      int offset, int limit) async {
    try {
      final result = await _dio.get(
        '/v1/public/characters',
        queryParameters: {
          'ts': 1,
          'apikey': _firebaseClass.apiKey,
          'hash': _firebaseClass.hash,
          'offset': offset,
          'limit': limit,
        },
      );
      return result.data['data']['results']
          .map<AllCharactersResultModel>(
              (r) => AllCharactersResultModel.fromMap(r))
          .toList();
    } catch (e, s) {
      FirebaseClass().recordError(e, s);
      log('Erro ao buscar personagens', error: e, stackTrace: s);
    }
    throw Exception('Erro ao buscar personagens');
  }
}
