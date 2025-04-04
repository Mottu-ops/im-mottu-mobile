import 'package:get/get.dart';
import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/domain/use_cases/i_pokemon_list_use_cases.dart';

class PokemonListPageController extends GetxController {
  IPokemonListUseCases pokemonList = Get.find<IPokemonListUseCases>();
  RxList<PokemonPreviewModel> pokemonPreviewModelList =
      <PokemonPreviewModel>[].obs;
  PokemonListPageController() {
    getPokemonList();
  }

  void getPokemonList() async {
    pokemonPreviewModelList.value = await pokemonList.getPokemonList();
  }
}
