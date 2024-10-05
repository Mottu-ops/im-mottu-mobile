import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_design_system/mottu_design_system.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/character_details_page.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/characters_page.dart';
import 'package:mottu_marvel/modules/characters/presentation/router/routes.dart';

Widget createAppForCharactersPageUnderTest() {
  return GetMaterialApp(
    title: 'Mottu - Marvel',
    themeMode: ThemeMode.dark,
    theme: mottuThemeDataLight,
    darkTheme: mottuThemeDataDark,
    initialRoute: CharactersRouteNames.CHARACTERS,
    getPages: [
      GetPage(
        name: CharactersRouteNames.CHARACTERS,
        page: () => const CharactersPage(),
      ),
      GetPage(
        name: CharactersRouteNames.CHARACTER_DETAILS,
        page: () => const CharacterDetailsPage(),
      ),
    ],
  );
}
