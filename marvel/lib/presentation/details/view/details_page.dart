import 'package:flutter/material.dart';
import 'package:marvel/domain/entities/characters/characters.dart';
import 'package:marvel/presentation/details/view/details_view.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.charactersEntity,
  });

  final CharactersEntity charactersEntity;

  @override
  Widget build(BuildContext context) => DetailsView(
        charactersEntity: charactersEntity,
      );
}
