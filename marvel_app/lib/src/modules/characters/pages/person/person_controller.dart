import 'package:flutter/material.dart';
import 'package:marvel_app/src/modules/characters/pages/characters/characters_controller.dart';
import 'package:marvel_app/src/shared/http/marvel_http_client.dart';
import 'package:marvel_app/src/shared/http/marvel_request.dart';
import 'package:marvel_app/src/shared/http/marvel_response.dart';
import 'package:marvel_app/src/shared/shared.dart';

class PersonController extends ChangeNotifier {
  final CharactersController charactersController;
  final MarvelHttpClient httpClient;

  PersonController({
    required this.charactersController,
    required this.httpClient,
  });

  Future<CharacterData> getCharacterLocal(String id) async {
    try {
      cache = charactersController.cache.firstWhere((p) => '${p.id}' == id);
    } catch (e) {
      cache =
          (await charactersController.getCharacters(id: id, cacheable: false))
              .firstWhere((p) => '${p.id}' == id);
    }

    return cache!;
  }

  
  Future<CharacterData> getCharacterInfoPlus(String id) async {
    try {
      MarvelResponse response =
          await httpClient.request(ComicsIDRequest(id: id));
      Map<String, dynamic> data = response.data;
      if (data["data"]["results"] != null) {
        List<ComicsItem> comics = (data["data"]["results"] as List?)
                ?.map((x) => ComicsItem.fromJson(x))
                .toList() ??
            [];
        cache = cache?.copyWith(comics: cache?.comics.copyWith(items: comics));
      }
    } catch (e, s) {
      print(s);
    }
    return cache!;
  }

  CharacterData? cache;
}

class ComicsIDRequest extends IMarvelRequest {
  final String id;

  ComicsIDRequest({required this.id});
  @override
  String get path => '/v1/public/characters/$id/comics';
}
