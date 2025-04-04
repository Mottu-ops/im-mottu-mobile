import 'package:pokedex/app/core/application/models/pokemon_model.dart';

abstract class IPokemonDetailsUseCase {
  Future<PokemonModel> getPokemon(int id);
}
