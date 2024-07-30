import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/characterDetail/controller/character_detail_controller.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/components/appBar/app_bar.dart';
import 'package:im_mottu_mobile/core/components/cards/cards.dart';
import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/shimmer/item_shimmer.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharacterDetailController>(
      init: CharacterDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: controller.isLoading
              ? AppAppBar.appBarBack(onTap: () {
                  Get.back();
                })
              : AppAppBar.appBarBack(
                  title: controller.character.name,
                  onTap: () {
                    Get.back();
                  },
                ),
          body: controller.isLoading
              ? AppLoading.appLoadingScaffold()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag:
                              "${controller.character.name.toLowerCase()}${controller.character..id}",
                          child: Center(
                            child: Container(
                              
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(image: NetworkImage(controller.character.thumbnail,))
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(height: 16),
                        // AppText.title(
                        //   text: controller.character.name,
                        //   fontSize: 24,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        const SizedBox(height: 16),
                        AppText.description(
                          text: controller.character.description,
                          fontSize: 14,
                        ),
                        const SizedBox(height: 16),
                        AppText.title(
                          text: "Quadrinhos",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 9,),
                        GridView.builder(
                          itemCount: controller.isLoadingComics
                              ? 6
                              : controller.comics.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 0.55),
                          itemBuilder: (c, i) {
                            if (!controller.isLoadingComics) {
                              ComicsResumeModel model = controller.comics[i];
                              return AppCards.comics(
                                  title: model.title,
                                  thumbnail: model.thumbnail);
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 9, bottom: 9),
                                child: AppItemShimmer.comic()
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        AppText.title(
                          text: "Eventos",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ...controller.character.events.map((event) {
                          return ListTile(
                            title: Text(event.name),
                          );
                        }),
                        const SizedBox(height: 16),
                        AppText.title(
                          text: "Series",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ...controller.character.series.map((series) {
                          return ListTile(
                            title: Text(series.name),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
