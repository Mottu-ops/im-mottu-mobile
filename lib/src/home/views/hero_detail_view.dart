import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/src/home/models/hero_dto.dart';

class HeroDetailView extends StatefulWidget {
  const HeroDetailView({super.key});

  @override
  State<HeroDetailView> createState() => _HeroDetailViewState();
}

class _HeroDetailViewState extends State<HeroDetailView> {
  late HeroDto hero;

  @override
  void initState() {
    hero = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name!),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Hero(
              tag: 'img-${hero.name}',
              child: CachedNetworkImage(
                imageUrl: hero.image!,
                fit: BoxFit.cover,
                height: 550,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    hero.description!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
