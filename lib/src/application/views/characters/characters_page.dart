import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/views/characters/characters_details/characters_details_page.dart';

import '../../controllers/characters/characters_controller.dart';
import 'widgets/characters_card.dart';

class CharactersPage extends GetView<CharactersController> {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchEC = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text('Marvel Characters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                controller.resetCharacters();
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchEC,
                decoration: InputDecoration(
                  hintText: 'Search Characters',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onFieldSubmitted: (value) {
                  controller.search.value = value;
                  controller.searchCharacter();
                  searchEC.clear();
                },
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.allCharacters.isEmpty) {
            return const Center(
                child: Text(
              'No characters found.',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !controller.loading.value) {
                controller.onEndScroll();
              }
              return true;
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: controller.allCharacters.length,
              itemBuilder: (_, index) {
                final character = controller.allCharacters[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => CharactersDetailsPage(
                          character: character,
                        ));
                  },
                  child: CharactersCard(
                    title: character.name ?? '',
                    url:
                        '${character.thumbnail?.path}.${character.thumbnail?.extension}',
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
