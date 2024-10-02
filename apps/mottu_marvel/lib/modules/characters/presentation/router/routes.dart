import 'package:get/get.dart';
import 'package:mottu_marvel/modules/characters/presentation/pages/character_details_page.dart';

import '../../di/characters_di.dart';
import '../pages/characters_page.dart';

class CharactersRouteNames {
  static const CHARACTERS = '/characters';
  static const CHARACTER_DETAILS = '/character-details';
}

class CharactersPagesRoutes {
  static final routes = [
    GetPage(
      name: CharactersRouteNames.CHARACTERS,
      page: () => const CharactersPage(),
      binding: CharactersBinding(),
    ),
    GetPage(
      name: CharactersRouteNames.CHARACTER_DETAILS,
      page: () => const CharacterDetailsPage(),
      binding: CharactersBinding(),
    ),
  ];
}
