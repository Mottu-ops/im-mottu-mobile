import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marvel_app/src/shared/utils/assets.dart';

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

  MarvelAssets _backgroundImageUrl(MarvelAssets? image) {
    if (image != null) return image;
    final int randomImagem = Random().nextInt(MarvelAssets.values.length);
    return MarvelAssets.values.firstWhere(
      (nAssets) => nAssets.index == randomImagem,
      orElse: () => MarvelAssets.bg01,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage(_backgroundImageUrl(backgroundImageUrl).localUri),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: margin,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
