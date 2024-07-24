import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/src/application/controllers/characters/characters_controller.dart';
import 'package:mottu_marvel/src/application/models/characters/characters_result/all_characters_result_model.dart';
import 'package:mottu_marvel/src/application/views/characters/widgets/characters_card.dart';

class CharactersRelatedDetailsPage extends GetView<CharactersController> {
  final AllCharactersResultModel character;
  final List<AllCharactersResultModel> relatedCharacters;

  const CharactersRelatedDetailsPage({
    super.key,
    required this.character,
    required this.relatedCharacters,
  });

  @override
  Widget build(BuildContext context) {
    String description = character.description ?? '';
    if (description == "") {
      description = 'Description not found';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? 'Detalhes do Personagem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        '${character.thumbnail?.path}.${character.thumbnail?.extension}',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: Get.height * 0.04,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              character.name ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.030,
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.030,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.red,
                    height: Get.height * 0.07,
                    width: Get.width * 0.29,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Comics'),
                        Text('${character.comics?.available ?? 0}'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: Get.height * 0.07,
                    width: Get.width * 0.29,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Stories'),
                        Text('${character.stories?.available ?? 0}'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: Get.height * 0.07,
                    width: Get.width * 0.29,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Series'),
                        Text('${character.series?.available ?? 0}'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.030,
              ),
              const Text(
                'Related Characters',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.020,
              ),
              Obx(() {
                if (relatedCharacters.isEmpty) {
                  return const Center(
                      child: Text('No related characters found.'));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: relatedCharacters.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final relatedCharacter = relatedCharacters[index];
                    return CharactersCard(
                      title: relatedCharacter.name ?? '',
                      url:
                          '${relatedCharacter.thumbnail?.path}.${relatedCharacter.thumbnail?.extension}',
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
