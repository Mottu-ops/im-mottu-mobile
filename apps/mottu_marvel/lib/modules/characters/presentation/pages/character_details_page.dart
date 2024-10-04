import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_details_page_controller.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

import '../widgets/character_item.dart';
import '../widgets/characters_page_progress_indicator.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final controller = Get.find<CharactersDetailsPageController>();

  @override
  Widget build(BuildContext context) {
    return Screen(
      scrollController: controller.scrollController,
      appBar: MyHeaderDelegate(
        backgroundImageUrl: controller.character.value?.imageUrl ??
            'https://www.epicstuff.com/cdn/shop/collections/MARVEL_1920x450_b691539a-a0cb-4a43-8d20-ca9d567ab290_1920x450.jpg?v=1581967770',
        bottomWidget: _CharacterName(
          name: controller.character.value?.name,
        ),
      ),
      body: [
        Obx(() {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MottuBody1Text.regular(
                controller.character.value?.description ?? 'Carregando descrição',
              ),
            ),
          );
        }),
        Obx(
          () {
            if ((controller.marvelResponse.value == null || controller.charactersList.isEmpty) &&
                controller.marvelResponse.value == null) {
              return const CharacterPageProgressIndicator();
            }

            if (controller.charactersList.isEmpty) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: MottuBody1Text.bold(
                      'Não há dados disponíveis',
                    ),
                  ),
                ),
              );
            }

            final List<Widget> charactersList = controller.charactersList
                .map((eachCharacter) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                      child: MarvelCharacterItem(
                        marvelCharacter: eachCharacter,
                      ),
                    ))
                .toList();

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => charactersList[index],
                childCount: charactersList.length,
              ),
            );
          },
        ),
        Obx(() {
          return controller.isFetching.value && controller.charactersList.isNotEmpty
              ? const CharacterPageProgressIndicator()
              : const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
        }),
      ],
    );
  }
}

class _CharacterName extends StatelessWidget {
  const _CharacterName({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: MottuColors.blackMedium,
      ),
      child: MottuHeading1Text.regular(
        name ?? 'Carregando nome...',
        color: MottuColors.white,
      ),
    );
  }
}
