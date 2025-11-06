import '../../../../../core/services/http_client/http_client_service.dart';
import '../../models/pokemon_details_model.dart';
import '../../models/pokemon_model.dart';
import '../pokemon_datasource.dart';

class PokemonRemoteDatasource implements PokemonDatasource {
  final HttpClientService _httpClientService;

  PokemonRemoteDatasource({required HttpClientService httpClientService})
    : _httpClientService = httpClientService;

  @override
  Future<PokemonDetailsModel> fetchPokemonDetails({
    required String pokemonId,
  }) async {
    final data = await _httpClientService.get(endpoint: '/pokemon/$pokemonId');
    return PokemonDetailsModel.fromMap(data);
  }

  @override
  Future<List<PokemonModel>> fetchPokemonList({
    required int pageLimit,
    required int pageOffset,
  }) async {
    final data = await _httpClientService.get(
      endpoint: '/pokemon',
      queryParameters: {'limit': pageLimit, 'offset': pageOffset},
    );

    final results = data['results'] as List;

    return results.map((json) => PokemonModel.fromMap(json)).toList();
  }
}
