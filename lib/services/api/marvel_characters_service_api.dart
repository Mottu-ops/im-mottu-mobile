import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart';
import 'package:marvel/models/character.dart';
import 'dart:convert' as convert;
import 'package:marvel/services/api/http_basic_client.dart';

class MarvelCharactersServiceAPI {
  final String url = "http://gateway.marvel.com";
  final String path = '/v1/public/characters';
  final HttpBaseClient httpBaseClient = HttpBaseClient();

  MarvelCharactersServiceAPI() {
    httpBaseClient.defaultHeaders = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<List<Character>> list({
    String nameStartsWith = '',
    int offset = 0,
    int limit = 20,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await httpBaseClient.get(
        uri,
        path: path,
        nameStartsWith: nameStartsWith,
        offset: offset,
        limit: limit,
      );
      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body =
            Map<String, dynamic>.from(convert.jsonDecode(response.body));
        List<Map<String, dynamic>> result =
            List<Map<String, dynamic>>.from(body["data"]["results"]);
        return Character.fromJsonList(result);
      }
      return [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Character>> get(
    int id, {
    int offset = 0,
    int limit = 1,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await httpBaseClient.get(
        uri,
        path: '$path/${id.toString()}',
        offset: offset,
        limit: limit,
      );
      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> body =
            Map<String, dynamic>.from(convert.jsonDecode(response.body));
        List<Map<String, dynamic>> result =
            List<Map<String, dynamic>>.from(body["data"]["results"]);
        return Character.fromJsonList(result);
      }
      return [];
    } catch (e) {
      return Future.error(e);
    }
  }
}
