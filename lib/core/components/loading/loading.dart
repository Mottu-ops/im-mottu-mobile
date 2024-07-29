import 'dart:math';

import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading {
  static final List<String> _loadingGifs = [
    'assets/images/loading.gif',
    'assets/images/loading2.gif',
    'assets/images/loading3.gif',
  ];

  static Widget loading() {
    final random = Random();
    log(random.nextInt(_loadingGifs.length));
    final randomGif = _loadingGifs[random.nextInt(_loadingGifs.length)];
    return Image.asset(randomGif);
  }

  static Widget appLoadingScaffold() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Center(
              child: SizedBox(
                width: 150,
                child: loading(),
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.title(text: 'Carregando', fontSize: 21),
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: LoadingAnimationWidget.prograssiveDots(color: AppThemes.white, size: 21),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///LOADGIN EFEITO HExagonal
  static Widget loadingHexagonDots(
      {Color? color = AppThemes.primaryRegular, double? size = 15}) {
    return LoadingAnimationWidget.hexagonDots(color: color!, size: size!);
  }
}
