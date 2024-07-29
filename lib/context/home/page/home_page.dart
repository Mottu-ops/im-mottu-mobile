import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/home/controller/home_controller.dart';
import 'package:im_mottu_mobile/context/home/model/charater_resume_model.dart';
import 'package:im_mottu_mobile/context/home/model/comics_resume_model.dart';
import 'package:im_mottu_mobile/core/components/buttons/buttons.dart';
import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
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
                              items: controller.banners.map((path) {
                                return Image.asset(
                                  path.img,
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
                                height: 130,
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
                                children: controller.banners.map((e) {
                                  int index = controller.banners.indexOf(e);
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 21),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.title(
                                      text: controller
                                          .banners[controller.currentIndex]
                                          .title),
                                  AppText.description(
                                      text: controller
                                          .banners[controller.currentIndex]
                                          .description),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  SizedBox(
                                    width: 180,
                                    height: 35,
                                    child: AppButtons.buttonSize(
                                      context: context,
                                      title: 'VER MAIS',
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                              height: 15,
                            ),
                            SizedBox(
                              height: 118,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.characters.length,
                                  itemBuilder: (c, i) {
                                    CharacterResumeModel model =
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
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            AppText.description(
                                              text: model.name,
                                              maxLine: 2,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13,
                                            ),
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
                              height: 225,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.comics.length,
                                  itemBuilder: (c, i) {
                                    ComicsResumeModel model =
                                        controller.comics[i];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          model.thumbnail),
                                                      fit: BoxFit.fill)),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              width: 120,
                                              child: AppText.description(
                                                  text: model.title,
                                                  maxLine: 2,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  textAlign: TextAlign.start),
                                            ),
                                            AppText.description(
                                                text: model.description,
                                                textAlign: TextAlign.start),
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
