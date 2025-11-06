import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/theme/app_colors.dart';

class PokemonTraitWidget extends StatelessWidget {
  const PokemonTraitWidget({
    super.key,
    required this.traitName,
    required this.traitDescription,
  });

  final String traitName;
  final String traitDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          traitName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          constraints: BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: AppColors.grey300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            traitDescription,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
