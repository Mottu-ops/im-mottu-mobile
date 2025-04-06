import 'package:get/get.dart';
import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/application/use_cases/pokemon_list_use_case.dart';

class PokemonListPageController extends GetxController {
  PokemonListUseCase pokemonList = PokemonListUseCase();
  RxList<PokemonPreviewModel> pokemonPreviewModelList =
      <PokemonPreviewModel>[].obs;
  PokemonListPageController() {
    getPokemonList();
  }

  void getPokemonList() async {
    pokemonPreviewModelList.value = await pokemonList.getPokemonList();
  }

  void onTapPokemonCard(PokemonPreviewModel pokemon) {
    Get.toNamed('/pokemon_details', arguments: pokemon);
  }
}
