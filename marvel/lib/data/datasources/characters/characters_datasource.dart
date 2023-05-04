import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:marvel/core/erros/exceptions.dart';
import 'package:marvel/core/utils/constants.dart';
import 'package:marvel/data/models/characters/characters.dart';

abstract class CharactersDatasourceAbs {
  Future<List<CharactersModel>> getList({
    String? orderBy,
  });
}

@LazySingleton(as: CharactersDatasourceAbs)
class CharactersDatasourceImpl implements CharactersDatasourceAbs {
  final http.Client _client;

  CharactersDatasourceImpl({
    @Named('http_module') required http.Client client,
  }) : _client = client;

  @override
  Future<List<CharactersModel>> getList({
    String? orderBy,
  }) async {
    try {
      final data = await _client.get(
        Uri.parse(
          '${Constants.baseUrl}/characters?limit=100&offset=0&orderBy=$orderBy&apikey=${Constants.apiKey}&ts=${Constants.ts}&hash=${Constants.hash}',
        ),
      );

      if (data.statusCode != 200) throw const HttpException();

      final decodeData = jsonDecode(data.body);

      final results = decodeData['data']['results'] as List;

      return results.map((e) => CharactersModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
