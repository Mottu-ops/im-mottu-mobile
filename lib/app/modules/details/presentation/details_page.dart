import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marvelapp/app/core/extensions/screen_extension.dart';
import 'package:marvelapp/app/core/style/fonts.dart';

import '../../../core/domain/entities/char_entity.dart';

class DetailsPage extends StatelessWidget {
  final Char hero;
  const DetailsPage({
    Key? key,
    required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      padding: EdgeInsets.all(48.scale),
      child: Column(
        children: [
          const DetailHeader(),
          SizedBox(height: 32.scale),
          CircleAvatar(
            foregroundImage: NetworkImage(
              hero.imageUrl,
            ),
            radius: 70.scale,
          ),
          SizedBox(height: 16.scale),
          Text(
            hero.name,
            style: theme.textTheme.headline2!.merge(
              TextStyle(
                color: theme.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 16.scale),
          Text(
            hero.description.isEmpty
                ? 'No description found 😥'
                : hero.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyText1!.merge(
              TextStyle(
                fontFamily: FontsMarvel.quicksand,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: Modular.to.pop,
          child: Icon(
            Icons.arrow_back_ios,
            size: 50.scale,
            color: theme.colorScheme.secondary,
          ),
        ),
        Flexible(
          child: Text.rich(
            textAlign: TextAlign.right,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hero ',
                  style: theme.textTheme.headline2!.merge(
                    TextStyle(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                TextSpan(
                  text: 'Details',
                  style: theme.textTheme.headline2!.merge(
                    TextStyle(
                      height: 0.8,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
