import 'package:get/get.dart';

import '../di/characters_di.dart';
import 'pagers/characters_page.dart';

class CharactersRouteNames {
  static const HOME = '/characters';
}

class CharactersPagesRoutes {
  static final routes = [
    GetPage(
      name: CharactersRouteNames.HOME,
      page: () => const CharactersPage(),
      binding: CharactersBinding(),
    ),
  ];
}
