import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pokemon_list/pokemon_list_page_controller.dart';

class PokemonListPage extends GetView<PokemonListPageController> {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.pokemonPreviewModelList.length,
          itemBuilder: (context, index) {
            final pokemon = controller.pokemonPreviewModelList[index];
            return Column(
              children: [
                Text(pokemon.name),
                Image.network(pokemon.imageUrl),
              ],
            );
          },
        ),
      ),
    );
  }
}
