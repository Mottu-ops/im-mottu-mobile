import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/views/pokemon_page.dart';
import 'package:im_mottu_mobile/views/pokemon_details_page.dart';
import 'package:im_mottu_mobile/data/models/pokemon_model.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const PokemonPage(),
  '/details': (context) => PokemonDetailPage(
        pokemon: ModalRoute.of(context)!.settings.arguments as Pokemon,
      ),
};
