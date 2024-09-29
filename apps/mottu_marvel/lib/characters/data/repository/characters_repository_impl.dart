import 'dart:convert';

import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:common/common.dart';
import 'package:mottu_marvel/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/characters/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl extends GetxService implements CharactersRepository {
  String? _etag;

  CharactersRepositoryImpl({required this.httpClient});

  final MottuHttpClient httpClient;

  String _generateHash(String timestamp) {
    final String toHash = timestamp + Environment.marvelPrivateKey + Environment.marvelPublicKey;
    return md5.convert(utf8.encode(toHash)).toString();
  }

  @override
  Future<MarvelResponse> fetchCharacters({int limit = 10, required int offset}) async {
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);

    Map<String, String> headers = {};
    if (_etag != null) {
      headers['If-None-Match'] = _etag!; //It should go to the DioInteceptor
    }

    try {
      final response = await httpClient.get(
        'characters',
        queryParameters: {
          'ts': timestamp,
          'apikey': Environment.marvelPublicKey,
          'hash': hash,
          'offset': offset,
          'limit': limit,
        },
        options: {'headers': headers},
      );

      print('Response data: ${response.data}');
      // print('New ETag: $_etag');

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      if (e.code == 304) {
        //TODO Cache
        print('http not modifiend');
        // return MovieList(movies: [Movie(name: 'Cached movie')]);
        print('get from caache');
      }

      rethrow; //TODO
    }
  }

  @override
  Future<MarvelResponse> fetchRelatedCharacters({required int id, int limit = 10, required int offset}) {
    // TODO: implement fetchRelatedCharacters
    throw UnimplementedError();
  }

  @override
  Future<MarvelResponse> filterCharactersByName({required String name, int limit = 10, required int offset}) {
    // TODO: implement filterCharactersByName
    throw UnimplementedError();
  }
}
