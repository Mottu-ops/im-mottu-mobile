import 'package:flutter/material.dart';
import 'package:im_mottu_flutter/app/shared/utils/date_format_extension.dart';

import '../../../../shared/widgets/img/cached_network_image_widget.dart';
import '../../interactor/models/result_character.dart';
import 'expandable_session_item.dart';

class CharacterDetailSheet extends StatelessWidget {
  const CharacterDetailSheet({super.key, required this.item});
  final ResultCharacter item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.95,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: size.width * 0.25, left: 22, right: 22),
                height: size.height * 0.80,
                width: size.width,
                decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style:
                            textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.bold),
                      ),
                      if (item.description.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Description is not found',
                            textAlign: TextAlign.justify,
                            style: textTheme.bodyLarge?.copyWith(),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.description,
                            textAlign: TextAlign.justify,
                            style: textTheme.bodyLarge?.copyWith(),
                          ),
                        ),
                      if (item.comics.items.isNotEmpty)
                        ExpandableSessionItem(
                          title: 'Comics',
                          widgets: item.comics.items
                              .map((element) => Text(
                                    '• ${element.name}',
                                    textAlign: TextAlign.justify,
                                    style: textTheme.bodyLarge?.copyWith(),
                                  ))
                              .toList(),
                        ),
                      if (item.events.items.isNotEmpty)
                        ExpandableSessionItem(
                          title: 'Events',
                          widgets: item.events.items
                              .map((element) => Text(
                                    '• ${element.name}',
                                    textAlign: TextAlign.justify,
                                    style: textTheme.bodyLarge?.copyWith(),
                                  ))
                              .toList(),
                        ),
                      if (item.series.items.isNotEmpty)
                        ExpandableSessionItem(
                          title: 'Series',
                          widgets: item.series.items
                              .map((element) => Text(
                                    '• ${element.name}',
                                    textAlign: TextAlign.justify,
                                    style: textTheme.bodyLarge?.copyWith(),
                                  ))
                              .toList(),
                        ),
                      if (item.stories.items.isNotEmpty)
                        ExpandableSessionItem(
                          title: 'Stories',
                          widgets: item.stories.items
                              .map((element) => Text(
                                    '• ${element.name}',
                                    textAlign: TextAlign.justify,
                                    style: textTheme.bodyLarge?.copyWith(),
                                  ))
                              .toList(),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: Text(
                          'Updated in ${item.modified.asDate()}',
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall?.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Hero(
                tag: 'character_hero_tag_${item.id}',
                child: SizedBox(
                  width: size.width * 0.45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Material(
                      elevation: 8,
                      child: CachedNetworkImageWidget(
                        imageUrl: '${item.thumbnail.path}/standard_fantastic.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
