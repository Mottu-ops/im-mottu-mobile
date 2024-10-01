import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/pagers/characters_page_controller.dart';
import 'package:mottu_design_system/mottu_design_system.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate(
              backgroundImageUrl:
                  'https://www.epicstuff.com/cdn/shop/collections/MARVEL_1920x450_b691539a-a0cb-4a43-8d20-ca9d567ab290_1920x450.jpg?v=1581967770',
              bottomWidget: const _FilterCharactersTextField(),
            ),
          ),
          GetX<CharactersPageController>(
            builder: (controller) {
              if (controller.marvelResponse.value == null || controller.filteredCharactersList.value == null) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                );
              }

              //TODO handle connection error: controller.filteredCharactersList.value == null
              print('list ${controller.filteredCharactersList.value!.length}');

              final charactersList = controller.filteredCharactersList.value!
                  .map((eachCharacter) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                        child: Text(
                          '${eachCharacter.name}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                  .toList();

              return SliverList.builder(
                itemCount: charactersList.length,
                itemBuilder: (context, index) {
                  return charactersList[index];
                },
              );
            },
          ),
        ],
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

// class CharactersPage extends StatelessWidget {
//   const CharactersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Screen(
//       body: Center(
//         child: GetX<CharactersPageController>(
//           builder: (controller) {
//             //TODO handle connection error
//             if (controller.marvelResponse.value == null) {
//               return const Center(
//                 child: CircularProgressIndicator.adaptive(),
//               );
//             }

//             final charactersList = controller.marvelResponse.value!.data.results
//                 .map((eachCharacter) => Text('${eachCharacter.name}'))
//                 .toList();

//             return ListView.builder(
//               itemCount: charactersList.length,
//               itemBuilder: (context, index) {
//                 return charactersList[index];
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
