import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/controller/character_controller.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/components/appBar/app_bar.dart';
import 'package:im_mottu_mobile/core/components/input_field/search_input_field.dart';
import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharacterController>(
      init: CharacterController(),
      builder: (controller) {
        final ScrollController scrollController = ScrollController();
        scrollController.addListener(() {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            controller.onScrollEnd();
          }
        });

        return Scaffold(
          appBar: AppAppBar.appBarBack(
            title: "Personagens",
            onTap: () {
              Get.back();
            },
          ),
          body: Padding(
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
                    onSaved: (_) => null),
                
                const SizedBox(height: 15),
                Expanded(
                  child: controller.isLoading && controller.characters.isEmpty
                      ? AppLoading.appLoadingScaffold()
                      : GridView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: controller.characters.length + 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 9),
                          itemBuilder: (c, i) {
                            if (i == controller.characters.length) {
                              return Visibility(
                                visible: controller.isLoadingMore,
                                child: Center(
                                  child: AppLoading.loading(),
                                ),
                              );
                            }
                            CharacterModel model = controller.characters[i];
                            return Padding(
                              padding: const EdgeInsets.only(right: 9),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          border: Border.all(
                                              color: AppThemes.primaryRegular,
                                              width: 2),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(model.thumbnail),
                                              fit: BoxFit.fill)),
                                    ),
                                    AppText.description(
                                        text: model.name,
                                        maxLine: 2,
                                        textAlign: TextAlign.center,
                                        fontSize: 14),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
