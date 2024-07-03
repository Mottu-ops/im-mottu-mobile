import 'package:marvel_app/src/shared/http/marvel_http_client.dart';
import 'package:marvel_app/src/shared/http/marvel_request.dart';
import 'package:marvel_app/src/shared/http/marvel_response.dart';
import 'package:marvel_app/src/shared/shared.dart';

class CharactersController {
  final MarvelHttpClient client;

  CharactersController({required this.client});

  Future<List<CharacterData>> getCharacters(
      {String? id, bool cacheable = true}) async {
    MarvelResponse response = await client.request(
      id == null ? CharactersRequest() : CharacterIDRequest(id: id),
    );

    CharactersResult result = CharactersResult.fromJson(response.data);
    if (cacheable) {
      _cache = result.data.results;

      return _cache;
    } else {
      return result.data.results;
    }
  }

  List<CharacterData> get cache => _cache;

  List<CharacterData> _cache = [];

  CharacterData? lastSelectedCharacter;
}

class CharactersRequest extends IMarvelRequest {
  @override
  String get path => '/v1/public/characters';
}

class CharacterIDRequest extends IMarvelRequest {
  final String id;

  CharacterIDRequest({required this.id});
  @override
  String get path => '/v1/public/characters/$id';
}
