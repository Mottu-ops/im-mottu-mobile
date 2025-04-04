import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon/pokemon_list/pokemon_list_page_controller.dart';
import 'package:pokedex/app/modules/pokemon/widgets/pokemon_card.dart';

class PokemonListPage extends GetView<PokemonListPageController> {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: controller.pokemonPreviewModelList.length,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                itemBuilder: (context, index) {
                  final pokemon = controller.pokemonPreviewModelList[index];
                  return PokemonCard(
                    pokemonPreviewModel: pokemon,
                    onTap: () => controller.onTapPokemonCard(pokemon),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 170.0,
                    mainAxisSpacing: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
