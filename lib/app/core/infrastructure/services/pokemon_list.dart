import 'package:get/get.dart';
import 'package:pokedex/app/core/domain/http_adapters/http_response.dart';
import 'package:pokedex/app/core/domain/http_adapters/i_http_client_adapter.dart';
import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/domain/services/i_pokemon_list.dart';
import 'package:pokedex/app/core/infrastructure/endpoints/endpoints.dart';

class PokemonList implements IPokemonList {
  final IHttpClientAdapter _httpClientAdapter = Get.find<IHttpClientAdapter>();
  @override
  Future<List<PokemonPreviewModel>> getPokemonList() async {
    HttpResponse httpResponse =
        await _httpClientAdapter.get(Endpoints.pokemon, queryParameters: {
      'limit': 1000000,
      'offset': 0,
    });
    List<PokemonPreviewModel> pokemonList = [];
    for (var pokemon in httpResponse.data['results']) {
      pokemonList.add(PokemonPreviewModel.fromJson(pokemon));
    }
    return pokemonList;
  }
}
