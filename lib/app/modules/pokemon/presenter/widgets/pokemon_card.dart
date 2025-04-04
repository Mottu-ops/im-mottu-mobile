import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemonPreviewModel});
  final PokemonPreviewModel pokemonPreviewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text(
              '#00${pokemonPreviewModel.id.toString()}',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              pokemonPreviewModel.name,
              style: GoogleFonts.poppins(
                fontSize: 12,
              ),
            ),
          ),
          Center(child: Image.network(pokemonPreviewModel.imageUrl)),
        ],
      ),
    );
  }
}
