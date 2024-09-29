import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/characters/presentation/pagers/characters_page_controller.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GetX<CharactersPageController>(builder: (controller) {
        return Text(controller.marvelResponse.value?.data.results.first.name ?? 'Nll');
      })),
    );
  }
}
