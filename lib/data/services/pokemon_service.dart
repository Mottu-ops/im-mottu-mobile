import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:im_mottu_mobile/core/constants/contants.dart';
import '../models/pokemon_model.dart';

class PokemonService {
  final Dio _dio;

  PokemonService(this._dio, {Dio? dio});

  Future<List<Pokemon>> fetchPokemons({int limit = 20, int offset = 0}) async {
    try {
      const url = '${Api.baseUrl}${ApiRoutes.pokemon}';
      final response = await _dio.get(
        url,
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'] as List;

        final futures = results.map((pokemonData) async {
          try {
            return await _fetchPokemonDetails(pokemonData['url']);
          } catch (e) {
            if (kDebugMode) {
              print('Erro ao buscar detalhes do Pokémon: $e');
            }
            return null;
          }
        });

        final pokemonsList = await Future.wait(futures);
        final result = pokemonsList
            .where((pokemon) => pokemon != null)
            .cast<Pokemon>()
            .toList();

        return result;
      } else {
        throw 'Erro ao carregar lista de Pokémons';
      }
    } on DioException catch (e) {
      throw "Erro ao carregar Pokémons $e";
    } catch (e) {
      throw 'Erro inesperado ao processar dados: $e';
    }
  }

  Future<Pokemon> fetchPokemonById(String id) async {
    try {
      final url = '${Api.baseUrl}${ApiRoutes.pokemon}/$id';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final pokemon = Pokemon.fromJson(response.data);

        return pokemon;
      } else if (response.statusCode == 404) {
        throw '$id não encontrado';
      } else {
        throw 'Erro ao carregar Pokémon "$id"';
      }
    } catch (e) {
      throw (
        'Erro inesperado ao processar dados do Pokémon: $e',
        originalError: e
      );
    }
  }

  Future<List<Pokemon>> fetchPokemonsByType(String type) async {
    try {
      final url = '${Api.baseUrl}${ApiRoutes.pokemonType}/$type';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final pokemonList = data['pokemon'] as List;

        final futures = pokemonList.map((item) async {
          try {
            return await _fetchPokemonDetails(item['pokemon']['url']);
          } catch (e) {
            if (kDebugMode) {
              print('Erro ao buscar Pokémon do tipo $type: $e');
            }
            return null;
          }
        });

        final results = await Future.wait(futures);
        return results
            .where((pokemon) => pokemon != null)
            .cast<Pokemon>()
            .toList();
      } else {
        throw "";
      }
    } on DioException catch (e) {
      throw "Erro ao carregar Pokémons $e";
    } catch (e) {
      throw 'Erro inesperado ao processar Pokémons do tipo "$type": $e';
    }
  }

  Future<Pokemon> _fetchPokemonDetails(String url) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Pokemon.fromJson(response.data);
      } else {
        throw ('Erro ao carregar detalhes do Pokémon: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw "$e";
    }
  }
}
