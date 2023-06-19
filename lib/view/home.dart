import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/widget/animatedHeroCard.dart';
import '/widget/heroCard.dart';
import '/controller/home.dart';
import '/object/hero.dart' as hero;

class Home extends StatelessWidget {
  Home({super.key});
  final PageController pageController = PageController();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print('Home');

    return GetX<HomeController>(
      builder: (homeController) {
        scrollController.addListener(() {
          if(scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent && !homeController.charging.value && !homeController.limit.value){
            homeController.updateHeroesList(searchController.text);
          }
        });
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 18,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),
                  label: "Home",
                  activeIcon: Icon(Icons.home, size: 30)),
              BottomNavigationBarItem(icon: Icon(Icons.settings),
                  label: "Settings",
                  activeIcon: Icon(Icons.settings, size: 30))
            ],
            onTap: (indx) {
              pageController.jumpToPage(indx);
              homeController.updatePage(indx.toDouble());
            },
            currentIndex: homeController.homeController.toInt(),
          ),
          body: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Stack(
                    children: [
                      Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: homeController.screenHeight.value *
                                        0.07,
                                    bottom: homeController.screenHeight.value *
                                        0.01,
                                    left: homeController.screenWidth.value *
                                        0.05,
                                    right: homeController.screenWidth.value *
                                        0.05),
                                child: TextField(
                                  controller: searchController,
                                  onEditingComplete: () async {
                                    scrollController.position.jumpTo(0);
                                    homeController.limit(false);
                                    List heroes = await homeController.searchHeroes(searchController.text);
                                    errorSnack(String msg) => Get.showSnackbar(GetSnackBar(
                                      backgroundColor: Colors.red,
                                      message: msg,
                                      duration: const Duration(seconds: 4),
                                      margin: EdgeInsets.only(bottom: homeController.screenHeight.value * 0.08)
                                    ));
                                    if (heroes.isEmpty) {
                                      errorSnack('Não foram encontrados heróis');
                                    } else if (heroes[0] == 409) {
                                      errorSnack('Não foram encontrados heróis');
                                    } else if (heroes[0] == 400) {
                                      errorSnack('Ocorreu um erro na solicitação');
                                    } else if (heroes[0] == 401) {
                                      errorSnack('Solicitação não autorizada');
                                    } else if (heroes[0] == 404) {
                                      errorSnack('Solicitação não encontrado');
                                    } else if (heroes[0] == 408) {
                                      errorSnack('A solicitação esta demorando');
                                    } else if (heroes[0] == 500) {
                                      errorSnack('O servidor Marvel esta com problemas');
                                    } else if (heroes[0] == 503) {
                                      errorSnack('O servidor Marvel esta com instabilidade');
                                    } else if (heroes[0] == 504) {
                                      errorSnack('O servidor Marvel não esta respondendo');
                                    }
                                  },
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Buscar herói',
                                    icon: Icon(Icons.search),
                                  ),
                                )
                            ),
                            Expanded(
                              child: GridView.count(
                                  controller: scrollController,
                                  padding: const EdgeInsets.all(5),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: ((homeController
                                      .screenWidth / 2) / (homeController
                                      .screenHeight / 3)),
                                  children: List.generate(homeController.heroes.length, (index) {
                                    hero.Hero data = homeController.heroes[index];
                                    return InkWell(
                                      onTap: () async {
                                        await homeController.updateCardDetail(heroInfo: data);
                                      },
                                      child: HeroCard(
                                          heroName: data.name,
                                          heroPicture: data.smallThumbnail),
                                    );
                                  })
                              ),
                            ),
                          ]
                      ),
                      homeController.charging.value ? Container(color: Colors.grey.withOpacity(0.7), height: homeController.screenHeight.value, width: homeController.screenWidth.value) : const SizedBox(),
                      homeController.charging.value ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
                      homeController.cardDetail.value ? AnimatedHeroCard(heroName: homeController.selectedHero.value.name, heroPicture: homeController.selectedHero.value.largeThumbnail, description: homeController.selectedHero.value.description, relatedHeroes: homeController.selectedHero.value.related) : const SizedBox()
                    ]
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: homeController.screenHeight * 0.07),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dark mode:'),
                          Switch(
                              value: homeController.darkMode.value,
                              onChanged: (dark) {
                                homeController.updateDarkMode(dark);
                              }
                          ),
                          homeController.darkMode.value ? const Icon(
                              Icons.dark_mode) : const Icon(
                              Icons.dark_mode_outlined)
                        ],
                      )
                    ],
                  ),
                )
              ]
          ),
        );
      }
    );
  }
}