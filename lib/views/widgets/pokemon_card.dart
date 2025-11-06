import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/data/models/pokemon_model.dart';
import 'package:im_mottu_mobile/core/constants/contants.dart';

class ModernPokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final int index;
  final VoidCallback onTap;

  const ModernPokemonCard({
    super.key,
    required this.pokemon,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = _getGradientColors(index);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPokemonNumber(),
                      const SizedBox(height: 4),
                      _buildPokemonName(),
                    ],
                  ),
                  _buildPokemonImage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '#${pokemon.id.toString().padLeft(3, '0')}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildPokemonName() {
    return Text(
      pokemon.name.isNotEmpty
          ? pokemon.name[0].toUpperCase() + pokemon.name.substring(1)
          : pokemon.name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
        shadows: [
          Shadow(
            offset: Offset(1, 1),
            blurRadius: 3,
            color: Colors.black26,
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPokemonImage() {
    return Center(
      child: Hero(
        tag: 'pokemon_${pokemon.id}',
        child: SizedBox(
          width: 70,
          height: 70,
          child: pokemon.imageUrl.isNotEmpty
              ? Image.network(
                  pokemon.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.catching_pokemon,
                      color: Colors.white,
                      size: 35,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                )
              : const Icon(
                  Icons.catching_pokemon,
                  color: Colors.white,
                  size: 35,
                ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors(int index) =>
      AppColors.pokemonGradients[index % AppColors.pokemonGradients.length];
}
