import 'package:flutter/material.dart';

import '../../../domain/entities/pokemon_entity.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCardWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 16,
        children: [
          Image.network(
            pokemon.imageUrl,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          Text(pokemon.name, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
