import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/application/theme/palettes.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_page/pokemon_details_page_controller.dart';
import 'package:pokedex/app/modules/pokemon_details/widgets/characteristic_box.dart';
import 'package:pokedex/app/modules/widgets/text_pokemon.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsPageController> {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.pokemonModel.value?.gifUrl != null)
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 360,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color:
                              controller.pokemonModel.value?.types.first.color,
                          gradient: LinearGradient(
                            colors: [
                              controller
                                      .pokemonModel.value?.types.first.color ??
                                  Colors.transparent,
                              controller.pokemonModel.value?.types.first.color
                                      .withValues(alpha: 0.5) ??
                                  Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(100000),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.network(
                        controller.pokemonModel.value!.gifUrl!,
                        width: Get.width,
                        height: 310,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 15,
                      child: InkWell(
                        onTap: controller.goBack,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Palettes.backButtonColor,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextPokemon(
                  text: controller.pokemonModel.value?.pokemonPreviewModel
                          .formattedName ??
                      '',
                  fontSize: 29,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextPokemon(
                  text:
                      'Nº${controller.pokemonModel.value?.pokemonPreviewModel.formattedId}',
                  fontSize: 20,
                  color: Palettes.grayTextColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CharacteristicBox(
                      boxTitle: 'Peso',
                      boxValue:
                          controller.pokemonModel.value?.weightFormatted ?? '',
                      boxIcon: Icons.monitor_weight_outlined,
                      boxWidth: Get.width / 2 - 15 - 7.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: CharacteristicBox(
                      boxTitle: 'Altura',
                      boxValue:
                          controller.pokemonModel.value?.heightFormatted ?? '',
                      boxIcon: Icons.height_rounded,
                      boxWidth: Get.width / 2 - 15 - 7.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CharacteristicBox(
                      boxTitle: 'XP Base',
                      boxValue: controller.pokemonModel.value?.baseExperience
                              .toString() ??
                          '',
                      boxIcon: Icons.abc,
                      boxWidth: Get.width / 2 - 15 - 7.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: CharacteristicBox(
                      boxTitle: 'Habilidade',
                      boxValue: controller
                              .pokemonModel.value?.abilities.firstOrNull ??
                          '',
                      boxIcon: Icons.height_rounded,
                      boxWidth: Get.width / 2 - 15 - 7.5,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
