import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_details_page_controller.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_page_controller.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

import '../../data/models/marvel_response_model.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key});

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  final controller = Get.find<CharactersDetailsPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(
              backgroundImageUrl: controller.character.value?.imageUrl ??
                  'https://www.epicstuff.com/cdn/shop/collections/MARVEL_1920x450_b691539a-a0cb-4a43-8d20-ca9d567ab290_1920x450.jpg?v=1581967770',
              bottomWidget: const _FilterCharactersTextField(),
            ),
          ),
          Obx(
            () {
              if (controller.marvelResponse.value == null || controller.charactersList.isEmpty) {
                return const _CharacterPageProgressIndicator();
              }

              //TODO handle connection error: controller.filteredCharactersList.value == null
              print('list ${controller.charactersList.length}');

              final List<Widget> charactersList = controller.charactersList
                  .map((eachCharacter) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                        child: _MarvelCharacterItem(
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
                ? const _CharacterPageProgressIndicator()
                : const SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  );
          }),
        ],
      ),
    );
  }
}

class _CharacterPageProgressIndicator extends StatelessWidget {
  const _CharacterPageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: MottuProgressIndicator(
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

class _FilterCharactersTextField extends StatelessWidget {
  const _FilterCharactersTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharactersPageController>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: MottuTextField(
        onChanged: controller.filterCharacters,
      ),
    );
  }
}

class _MarvelCharacterItem extends StatelessWidget {
  const _MarvelCharacterItem({super.key, required this.marvelCharacter});

  final MarvelCharacter marvelCharacter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('charactersDetails', arguments: {'character': marvelCharacter}),
      child: Row(
        children: [
          MottuNetworkImage(
            url: marvelCharacter.imageUrl,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            marvelCharacter.name,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
