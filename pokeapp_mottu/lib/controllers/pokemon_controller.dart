import 'package:dio/dio.dart';
import 'package:pokeapp_mottu/models/pokemon.dart';

class PokemonController{
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  Future<List<Pokemon>> fetchPokemons({int limit = 20, int offset = 0}) async {
    try {

      final response = await _dio.get('/pokemon', queryParameters: {
        'limit': limit,
        'offset': offset,
      });

      final results = response.data['results'] as List;
      return results.map((json) => Pokemon.fromJson(json)).toList();

    } catch (e) {
      throw Exception('Erro ao buscar os pokémons: $e');
    }
  }

}