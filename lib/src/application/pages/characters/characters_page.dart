import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'characters_controller.dart';
import 'widgets/characters_card.dart';

class CharactersPage extends GetView<CharactersController> {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return CharactersCard(
                  title: character.name ?? '',
                  url:
                      '${character.thumbnail?.path}.${character.thumbnail?.extension}',
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
