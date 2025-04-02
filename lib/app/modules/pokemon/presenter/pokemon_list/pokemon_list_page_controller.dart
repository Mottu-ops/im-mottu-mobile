import 'package:get/get.dart';
import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';
import 'package:pokedex/app/core/domain/services/i_pokemon_list.dart';

class PokemonListPageController extends GetxController {
  IPokemonList pokemonList = Get.find<IPokemonList>();
  RxList<PokemonPreviewModel> pokemonPreviewModelList =
      <PokemonPreviewModel>[].obs;
  PokemonListPageController() {
    getPokemonList();
  }

  void getPokemonList() async {
    pokemonPreviewModelList.value = await pokemonList.getPokemonList();
  }
}
