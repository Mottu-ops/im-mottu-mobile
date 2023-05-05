import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/details_page/details_module.dart';
import 'package:mottu_test/modules/home/widgets/overview_movie.dart';

class CardList extends StatelessWidget {
  final Results comicsCharacter;
  const CardList({required this.comicsCharacter, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Modular.to
          .pushNamed(DetailsModule.moduleRoute, arguments: comicsCharacter),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.defaultBlack.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        height: size.height * 0.35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: comicsCharacter.id,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      '${comicsCharacter.thumbnail.path}.${comicsCharacter.thumbnail.extension}',
                    ),
                  ),
                ),
              ),
            ),
            OverviewMovie(character: comicsCharacter, size: size)
          ],
        ),
      ),
    );
  }
}
