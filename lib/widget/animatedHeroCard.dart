import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/home.dart';
import '/object/hero.dart' as hero;

class AnimatedHeroCard extends StatefulWidget {
  const AnimatedHeroCard({super.key, required this.heroName, required this.heroPicture, required this.description, required this.relatedHeroes});

  final String heroPicture;
  final String heroName;
  final String description;
  final List relatedHeroes;

  @override
  State<AnimatedHeroCard> createState() => _AnimatedHeroCardState();
}

class _AnimatedHeroCardState extends State<AnimatedHeroCard> with SingleTickerProviderStateMixin {
  final homeController = Get.find<HomeController>();
  Duration animDuration = const Duration(seconds: 1);
  late AnimationController animController;
  late Animation<double> animationWidth;
  late Animation<double> animationHeight;
  late PageController pageController;
  late int currentPage;
  bool pageHasChanged = false;
  late IndexedWidgetBuilder itemBuilder;

  @override
  void initState() {
    currentPage = 0;
    pageController = PageController(
      viewportFraction: 0.8,
      initialPage: currentPage,
    );
    animController = AnimationController(vsync: this, duration: animDuration)..addListener(() {setState(() {});});
    animationWidth = Tween(begin: homeController.screenWidth.value / 2, end: (homeController.screenWidth.value * 0.9)).animate(animController);
    animationHeight = Tween(begin: homeController.screenHeight.value * 0.65, end: (homeController.screenHeight.value * 0.8)).animate(animController);
    animController.forward();
    itemBuilder = (BuildContext context, int index) {
      List<Widget> images = [];
      for (hero.Hero value in widget.relatedHeroes) {
        images.add(
          InkWell(
            onTap: () {
              homeController.cardDetail(!homeController.cardDetail.value);
              homeController.updateCardDetail(heroInfo: value);
            },
            child: Image.network(value.smallThumbnail)
          )
        );
      }
      return images[index % images.length];
    };
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () {
        homeController.cardDetail(!homeController.cardDetail.value);
      },
      child: Center(
        child: Container(
          height: animationHeight.value,
          width: animationWidth.value,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 5
              )
            ],
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(widget.heroPicture),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.heroName,
                  style: TextStyle(
                    color: theme.textTheme.labelMedium?.color,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: theme.textTheme.labelMedium?.color,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: homeController.screenHeight * 0.2,
                width: homeController.screenWidth * 0.6,
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        pageHasChanged = true;
                        currentPage = value;
                      });
                    },
                    controller: pageController,
                    itemBuilder: (context, index) => AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        var result = pageHasChanged ? pageController.page! : currentPage * 1.0;
                        var value = result - index;
                        value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

                        return Center(
                          child: SizedBox(
                            height: Curves.easeOut.transform(value) * homeController.screenHeight.value,
                            width: Curves.easeOut.transform(value) * homeController.screenWidth.value,
                            child: child,
                          ),
                        );
                      },
                      child: itemBuilder(context, index),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
