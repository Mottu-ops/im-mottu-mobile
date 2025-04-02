import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';

abstract class IPokemonList {
  Future<List<PokemonPreviewModel>> getPokemonList();
}
