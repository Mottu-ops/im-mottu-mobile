import '../models/pokemon_details_model.dart';
import '../models/pokemon_model.dart';

abstract interface class PokemonDatasource {
  Future<List<PokemonModel>> fetchPokemonList({required int pageLimit, required int pageOffset});
  Future<PokemonDetailsModel> fetchPokemonDetails({required String pokemonId});
}
