import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pokemon_list/pokemon_list_page.dart';

import 'app/modules/pokemon/presenter/pokemon_list/pokemon_list_page_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
      title: 'Pokedéx',
      theme: ThemeData(),
      initialRoute: '/',
      initialBinding: PokemonListPageBinding(),
      getPages: [
        GetPage(
          name: '/',
          binding: PokemonListPageBinding(),
          page: () => PokemonListPage(),
        ),
      ]));
}
