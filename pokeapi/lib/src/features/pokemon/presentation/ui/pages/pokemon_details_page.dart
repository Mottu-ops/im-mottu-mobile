import 'package:flutter/material.dart';

import '../../../domain/entities/pokemon_entity.dart';
import '../widgets/pokemon_trait_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Pokémon')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                pokemon.imageUrl,
                height: 210,
                width: 201,
                fit: BoxFit.contain,
              ),
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PokemonTraitWidget(
                    traitName: 'Altura',
                    traitDescription: '${pokemon.height.toInt()}',
                  ),
                  PokemonTraitWidget(
                    traitName: 'Peso',
                    traitDescription: '${pokemon.weight.toInt()}',
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
