import 'dart:developer';

import 'package:get/get.dart';
import 'package:pokedex/app/core/domain/services/i_pokemon_list.dart';

class PokemonListPageController extends GetxController {
  IPokemonList pokemonList = Get.find<IPokemonList>();

  PokemonListPageController() {
    getPokemonList();
  }

  void getPokemonList() async {
    var a = await pokemonList.getPokemonList();
    log(a.toString());
  }
}
