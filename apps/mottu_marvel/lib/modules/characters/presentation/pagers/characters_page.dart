import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/pagers/characters_page_controller.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final controller = Get.find<CharactersPageController>();

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
              backgroundImageUrl:
                  'https://www.epicstuff.com/cdn/shop/collections/MARVEL_1920x450_b691539a-a0cb-4a43-8d20-ca9d567ab290_1920x450.jpg?v=1581967770',
              bottomWidget: const _FilterCharactersTextField(),
            ),
          ),
          Obx(
            () {
              if (controller.marvelResponse.value == null || controller.filteredCharactersList.isEmpty) {
                return const _CharacterPageProgressIndicator();
              }

              //TODO handle connection error: controller.filteredCharactersList.value == null
              print('list ${controller.filteredCharactersList.length}');

              final List<Widget> charactersList = controller.filteredCharactersList
                  .map((eachCharacter) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                        child: Text(
                          '${eachCharacter.name}',
                          style: TextStyle(color: Colors.white),
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
