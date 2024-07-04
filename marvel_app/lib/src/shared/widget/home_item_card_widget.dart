

import 'package:flutter/material.dart';
import 'package:marvel_app/src/shared/utils/assets.dart';
import 'package:marvel_app/src/shared/utils/functions.dart';
import 'package:marvel_app/src/shared/widget/single_item_card_widget.dart';

class HomeItemCard extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final MarvelAssets? backgroundImageUrl;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const HomeItemCard({
    super.key,
    required this.label,
    this.onPressed,
    this.backgroundImageUrl,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 21.0,
    ),
  });


  @override
  Widget build(BuildContext context) {
    return SingleItemCard(
      padding: padding,
      margin: margin,
      label: label,
      onPressed: onPressed,
      backgroundImageUrl: (backgroundImageUrl != null)
          ? backgroundImageUrl!.imageProvider
          : randomBackgroundImage().imageProvider,
    );
  }
}
