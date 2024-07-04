import 'dart:math';

import 'package:marvel_app/src/shared/utils/assets.dart';

MarvelAssets randomBackgroundImage() {
  final int randomImagem = Random().nextInt(MarvelAssets.values.length);
  return MarvelAssets.values.firstWhere(
    (nAssets) => nAssets.index == randomImagem,
    orElse: () => MarvelAssets.bg01,
  );
}
