import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex/app/modules/pokemon/pokemon_list/pokemon_list_page_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(GetMaterialApp(
      title: 'Pokedéx',
      theme: ThemeData(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      initialBinding: PokemonListPageBinding(),
      getPages: [
        GetPage(
          name: '/',
          binding: PokemonListPageBinding(),
          page: () => PokemonListPage(),
        ),
      ]));
}
