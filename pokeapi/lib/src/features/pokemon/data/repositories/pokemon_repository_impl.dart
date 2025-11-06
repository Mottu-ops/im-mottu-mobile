import 'package:pokeapi/src/features/pokemon/domain/entities/pokemon_entity.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _datasource;

  const PokemonRepositoryImpl({required PokemonDatasource datasource})
    : _datasource = datasource;

  @override
  Future<List<PokemonEntity>> fetchPokemons({
    required int pageLimit,
    required int pageOffset,
  }) async {
    final pokemonList = await _datasource.fetchPokemonList(
      pageLimit: pageLimit,
      pageOffset: pageOffset,
    );

    final pokemonDetails = await Future.wait(
      pokemonList.map(
        (pokemon) => _datasource.fetchPokemonDetails(pokemonId: pokemon.id),
      ),
    );

    return pokemonDetails.map((details) => details.toPokemonEntity()).toList();
  }
}
