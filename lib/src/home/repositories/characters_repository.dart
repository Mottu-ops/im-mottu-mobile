import 'package:get/get.dart';
import 'package:marvel_app/src/common/infrastructure/http/http.dart';
import 'package:marvel_app/src/home/models/hero_dto.dart';
import 'package:marvel_app/src/home/models/params_dto.dart';
import 'package:marvel_app/src/home/repositories/i_characters_repository.dart';

class CharactersRepository implements ICharactersRepository {
  final HttpClient _client;
  CharactersRepository(this._client);

  @override
  Future<List<HeroDto>> getHeroes({ParamsDto? params}) async {
    try {
      final response = await _client.get(
        '/characters',
        query: {
          'limit': params?.limit ?? 10,
          'offset': params?.offset ?? 0,
        }..addIf(params?.nameStartsWith?.isNotEmpty, 'nameStartsWith', params?.nameStartsWith),
      );
      if (response.status == HttpStatus.ok) {
        return (response.data['data']['results'] as List).map((e) => HeroDto.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('ERROR!');
    }
  }
}
