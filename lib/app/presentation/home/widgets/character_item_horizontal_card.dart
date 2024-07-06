import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/app/core/routes/constants_routes.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';
import 'package:mottu_marvel/app/domain/entities/character_entity.dart';
import 'package:mottu_marvel/app/presentation/details/pages/details_page.dart';

class CharacterItemHorizontalCard extends StatelessWidget {
  final CharacterEntity character;
  final Function()? onPress;

  const CharacterItemHorizontalCard({
    super.key,
    required this.character,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DETAILS_ROUTE,
          arguments: DetailsPageArguments(
            character: character,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (character.thumbnail?.url != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Hero(
                    tag: character.name!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: SizedBox(
                        height: 64,
                        width: 64,
                        child: CachedNetworkImage(
                          height: 64,
                          fit: BoxFit.cover,
                          imageUrl: character.thumbnail!.url,
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  character.name?.toUpperCase() ?? '',
                  style: const TextStyle(
                    color: AppColors.grey3,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
