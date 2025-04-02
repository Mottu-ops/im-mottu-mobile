import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pokemon_list/pokemon_list_page.dart';

import 'app/modules/pokemon/presenter/pokemon_list/PokemonListPageBinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Pokedéx',
        theme: ThemeData(),
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            binding: PokemonListPageBinding(),
            page: () => PokemonListPage(),
          ),
        ]);
  }
}
