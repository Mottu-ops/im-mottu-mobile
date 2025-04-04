import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/application/models/pokemon_preview_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemonPreviewModel}) : ver = 1;
  const PokemonCard.v2({super.key, required this.pokemonPreviewModel})
      : ver = 2;
  const PokemonCard.v3({super.key, required this.pokemonPreviewModel})
      : ver = 3;
  final PokemonPreviewModel pokemonPreviewModel;
  final int ver;

  @override
  Widget build(BuildContext context) {
    if (ver == 3) {
      return Card(
        color: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Center(child: Image.network(pokemonPreviewModel.imageUrl)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 10,
                            height: 23,
                            color: Colors.black,
                            child: Container(
                              width: 10,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 1, top: 1, left: 3, right: 8),
                              child: Text(
                                pokemonPreviewModel.formattedId,
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 10,
                        height: 23,
                        color: Colors.black,
                        child: Container(
                          width: 10,
                          height: 23,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6)),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 3.5, bottom: 3.5),
              child: SizedBox(
                width: 140,
                child: Text(
                  pokemonPreviewModel.formattedName,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
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
