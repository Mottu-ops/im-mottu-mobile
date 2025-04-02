import 'package:flutter/material.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pokemon_list/pokemon_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedéx',
      theme: ThemeData(),
      home: const PokemonListPage(),
    );
  }
}
