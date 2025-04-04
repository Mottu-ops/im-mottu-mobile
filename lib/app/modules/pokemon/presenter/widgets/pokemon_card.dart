import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/domain/models/pokemon_preview_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemonPreviewModel}) : ver = 1;
  const PokemonCard.tag({super.key, required this.pokemonPreviewModel})
      : ver = 2;
  final PokemonPreviewModel pokemonPreviewModel;
  final int ver;

  @override
  Widget build(BuildContext context) {
    if (ver == 2) {
      return Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                  child: Text(
                    '#00${pokemonPreviewModel.id.toString()}',
                    style:
                        GoogleFonts.poppins(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(child: Image.network(pokemonPreviewModel.imageUrl)),
            Center(
              child: Text(
                pokemonPreviewModel.name,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      );
    }
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
