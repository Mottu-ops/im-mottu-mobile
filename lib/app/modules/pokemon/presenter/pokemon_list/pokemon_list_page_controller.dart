import 'package:get/get.dart';
import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/application/use_cases/pokemon_list_use_cases.dart';

class PokemonListPageController extends GetxController {
  PokemonListUseCases pokemonList = PokemonListUseCases();
  RxList<PokemonPreviewModel> pokemonPreviewModelList =
      <PokemonPreviewModel>[].obs;
  PokemonListPageController() {
    getPokemonList();
  }

  void getPokemonList() async {
    pokemonPreviewModelList.value = await pokemonList.getPokemonList();
  }
}
