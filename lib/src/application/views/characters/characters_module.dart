import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mottu_marvel/src/application/bindings/characters/characters_bindings.dart';
import 'package:mottu_marvel/src/application/modules/module.dart';
import 'package:mottu_marvel/src/application/views/characters/characters_page.dart';

class CharactersModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/characters',
      page: () => const CharactersPage(),
      binding: CharactersBindings(),
    ),
  ];
}
