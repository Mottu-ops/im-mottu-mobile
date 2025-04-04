import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_page_controller.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsPageController> {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(controller.pokemonPreviewModel.name),
            backgroundColor: Colors.red,
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Center(
                child: Text(
                  'Details of ${controller.pokemonPreviewModel.name}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
