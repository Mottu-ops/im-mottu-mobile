import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/controller/character_controller.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/components/appBar/app_bar.dart';
import 'package:im_mottu_mobile/core/components/cards/cards.dart';
import 'package:im_mottu_mobile/core/components/input_field/search_input_field.dart';
import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/shimmer/item_shimmer.dart';
import 'package:im_mottu_mobile/core/components/try_again/try_again.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharacterController>(
      init: CharacterController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppAppBar.appBarBack(
            title: "Personagens",
            onTap: () {
              Get.back();
            },
          ),
          body: AppTryAgain.fullScreen(
          context: context,
          onTap: () {
            controller.fetchCharacters();
          },
          tryAgain: controller.tryAgain,
          widget: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  AppSearchInputField(
                      controller: controller.searchController,
                      iconPrefix: Icons.search,
                      labelText: 'Pesquisar personagens',
                      validator: (_) => null,
                      onChanged: (e) {
                        controller.onSearch(e);
                      },
                      onSaved: (_) => {}),
                  const SizedBox(height: 15),
                  Expanded(
                    child: controller.isLoading && controller.characters.isEmpty
                        ? AppLoading.appLoadingScaffold()
                        : GridView.builder(
                            controller: controller.scrollController,
                            shrinkWrap: true,
                            itemCount: controller.characters.length + 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.65,
                                    mainAxisSpacing: 9,
                                    crossAxisSpacing: 6),
                            itemBuilder: (c, i) {
                              if (i == controller.characters.length) {
                                return Visibility(
                                  visible: controller.isLoadingMore,
                                  child: Center(
                                    child: AppItemShimmer.character(),
                                  ),
                                );
                              }
                              CharacterModel model = controller.characters[i];
                              return AppCards.character(
                                  model: model, width: 120, height: 120);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
