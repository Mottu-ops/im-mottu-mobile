import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';

abstract class IPokemonListUseCase {
  Future<List<PokemonPreviewModel>> getPokemonList();
}
