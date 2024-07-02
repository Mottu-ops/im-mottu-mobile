import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/src/home/controllers/character_controller.dart';
import 'package:marvel_app/src/home/views/hero_detail_view.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final CharacterController controller = Get.find();
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? TextField(
                controller: controller.searchTextController,
                decoration: const InputDecoration(
                  hintText: 'Search Heroes',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (query) {
                  controller.updateSearchQuery(query);
                },
              )
            : const Text(
                'Marvel Heroes',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSearchActive ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
                if (!isSearchActive) {
                  controller.searchTextController.clear();
                  controller.updateSearchQuery('');
                }
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getHeroes(),
        child: Obx(() {
          if (controller.isLoading.value && controller.heroes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.isError.value) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('An error occurred!',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                      )),
                  Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.red,
                    size: 100,
                  ),
                ],
              ),
            );
          } else {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!controller.isLoadingMore.value &&
                          scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        controller.loadMoreHeroes();
                      }
                      return false;
                    },
                    child: Scrollbar(
                      thickness: 5,
                      thumbVisibility: true,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        padding: const EdgeInsets.all(24),
                        itemCount: controller.heroes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final hero = controller.heroes[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const HeroDetailView(),
                                arguments: hero,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: GridTile(
                                footer: Container(
                                  height: 50,
                                  color: Colors.black,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: FittedBox(
                                    child: Text(
                                      hero.name!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                                child: Hero(
                                  tag: 'img-${hero.name}',
                                  child: CachedNetworkImage(
                                    imageUrl: hero.image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                if (controller.isLoadingMore.value)
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 16,
                    child: SafeArea(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            );
          }
        }),
      ),
    );
  }
}
