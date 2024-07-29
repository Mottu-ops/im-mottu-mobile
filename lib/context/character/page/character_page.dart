import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/controller/character_controller.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
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
          return Scaffold(
            body: controller.isLoading
                ? AppLoading.appLoadingScaffold()
                : ListView(
                    children: [
                      SizedBox(
                        height: 250,
                        child: Stack(
                          children: [
                            CarouselSlider(
                              items: controller.imagePaths.map((path) {
                                return Image.asset(
                                  path,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 250,
                                autoPlay: true,
                                viewportFraction: 1,
                                disableCenter: true,
                                enableInfiniteScroll: true,
                                reverse: false,
                                onPageChanged: (index, reason) {
                                  controller.pageChange(index);
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                        colors: [
                                      AppThemes.transparent,
                                      AppThemes.bgPrimary,
                                    ])),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: controller.imagePaths.map((url) {
                                  int index =
                                      controller.imagePaths.indexOf(url);
                                  return Container(
                                    width: 33.0,
                                    height: 6.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: controller.currentIndex == index
                                          ? const Color.fromRGBO(
                                              255, 255, 255, 0.898)
                                          : const Color.fromRGBO(
                                              255, 255, 255, 0.4),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                AppText.title(text: 'Personagens'),
                                const Spacer(),
                                AppText.title(
                                    text: 'VER MAIS',
                                    color: AppThemes.primaryRegular,
                                    letterSpacing: 3),
                                const Icon(Icons.arrow_right_alt)
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            SizedBox(
                              height: 118,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.characters.length,
                                  itemBuilder: (c, i) {
                                    CharacterModel model =
                                        controller.characters[i];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(99),
                                                  border: Border.all(
                                                      color: AppThemes
                                                          .primaryRegular,
                                                      width: 2),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          model.thumbnail))),
                                            ),
                                            AppText.title(text: model.name),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Row(
                              children: [
                                AppText.title(text: 'Quadrinhos'),
                                const Spacer(),
                                AppText.title(
                                    text: 'VER MAIS',
                                    color: AppThemes.primaryRegular,
                                    letterSpacing: 3),
                                const Icon(Icons.arrow_right_alt)
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.characters.length,
                                  itemBuilder: (c, i) {
                                    CharacterModel model =
                                        controller.characters[i];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                 
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          model.thumbnail), fit: BoxFit.cover)),
                                            ),
                                            AppText.title(text: model.name, textAlign: TextAlign.start),
                                            AppText.description(text: model.name, textAlign: TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
