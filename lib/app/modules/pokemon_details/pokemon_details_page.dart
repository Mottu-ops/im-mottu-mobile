import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_page_controller.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsPageController> {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.pokemonModel.value?.gifUrl != null)
                Container(
                    height: 350,
                    color: controller.pokemonModel.value?.types.first.color,
                    width: Get.width,
                    child: Image.network(
                      controller.pokemonModel.value!.gifUrl!,
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                    )),
              Text(controller.pokemonModel.value?.name ?? ''),
              Text('Height: ${controller.pokemonModel.value?.height}'),
              Text('Weight: ${controller.pokemonModel.value?.weight}'),
            ],
          );
        }),
      ),
    );
  }
}
