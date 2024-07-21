import 'package:flutter/material.dart';
import 'package:im_mottu_flutter/app/shared/utils/date_format_extension.dart';

import '../../../../shared/widgets/img/cached_network_image_widget.dart';
import '../../interactor/models/result_character.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key, required this.item, this.onTap});
  final ResultCharacter item;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'character_hero_tag_${item.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: CachedNetworkImageWidget(
                  imageUrl: '${item.thumbnail.path}/standard_medium.jpg',
                ),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge
                          ?.copyWith(color: colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      item.modified.asDate(),
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
