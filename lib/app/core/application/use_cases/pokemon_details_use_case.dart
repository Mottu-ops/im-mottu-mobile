import 'package:get/get.dart';
import 'package:pokedex/app/core/application/models/pokemon_model.dart';
import 'package:pokedex/app/core/domain/http_adapters/i_http_client_adapter.dart';
import 'package:pokedex/app/core/domain/use_cases/i_pokemon_details_use_case.dart';

class PokemonDetailsUseCase implements IPokemonDetailsUseCase {
  final IHttpClientAdapter _httpClientAdapter = Get.find<IHttpClientAdapter>();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final response = await _httpClientAdapter.get(
      'https://pokeapi.co/api/v2/pokemon/$id',
    );

    if (response.statusCode.isSuccess) {
      return PokemonModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
