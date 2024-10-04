import 'dart:convert';

import 'package:analytics/analytics.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:common/common.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl extends GetxService implements CharactersRepository {
  CharactersRepositoryImpl({required this.httpClient, required this.analytics});

  final MottuHttpClient httpClient;
  final AnalyticsService analytics;

  String _generateHash(String timestamp) {
    final String toHash = timestamp + Environment.marvelPrivateKey + Environment.marvelPublicKey;
    return md5.convert(utf8.encode(toHash)).toString();
  }

  @override
  Future<MarvelResponse> fetchCharacters({int limit = 20, required int offset}) async {
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);

    final queryParameters = {
      'ts': timestamp,
      'apikey': Environment.marvelPublicKey,
      'hash': hash,
      'offset': offset,
      'limit': limit,
    };

    try {
      final response = await httpClient.get(
        'characters',
        queryParameters: queryParameters,
      );

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      analytics.logError(e, properties: {'url': 'characters', ...queryParameters});
      rethrow;
    }
  }

  @override
  Future<MarvelResponse> filterCharactersByName({required String name, int limit = 10, required int offset}) async {
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);
    final queryParameters = {
      'ts': timestamp,
      'apikey': Environment.marvelPublicKey,
      'hash': hash,
      'offset': offset,
      'limit': limit,
      'name': name,
    };

    try {
      final response = await httpClient.get('characters', queryParameters: queryParameters);

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      analytics.logError(e, properties: {'url': 'characters', 'filter': true, ...queryParameters});
      rethrow; //TODO
    }
  }

  @override
  Future<MarvelResponse> fetchRelatedCharacters(
      {List<String>? comics, List<String>? series, List<String>? events, int limit = 10, required int offset}) async {
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);
    final queryParameters = {
      'ts': timestamp,
      'apikey': Environment.marvelPublicKey,
      'hash': hash,
      'offset': offset,
      'limit': limit,
      if (comics?.isNotEmpty == true) 'comics': comics?.first,
      if (series?.isNotEmpty == true) 'series': series?.first,
      if (events?.isNotEmpty == true) 'events': events?.first,
    };

    try {
      final response = await httpClient.get('characters', queryParameters: queryParameters);

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      analytics.logError(e, properties: {'url': 'characters', 'filter': true, ...queryParameters});
      rethrow; //TODO
    }
  }
}
