import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';

abstract class IPokemonListUseCases {
  Future<List<PokemonPreviewModel>> getPokemonList();
}
