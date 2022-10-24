import 'package:flutter/material.dart';

import 'i_colors.dart';

class ColorsMarvel implements IColors {
  factory ColorsMarvel() => _instance;
  ColorsMarvel._();

  static final ColorsMarvel _instance = ColorsMarvel._();

  @override
  final MaterialColor black = const MaterialColor(
    0xFF181818,
    <int, Color>{
      50: Color(0xFFfbfbfb),
      100: Color(0xFFf6f6f6),
      200: Color(0xFFf1f1f1),
      300: Color(0xFFe7e7e7),
      400: Color(0xFFc4c4c4),
      500: Color(0xFFa6a6a6),
      600: Color(0xFF7c7c7c),
      700: Color(0xFF686868),
      800: Color(0xFF494949),
      900: Color(_blackPrimaryValue),
    },
  );
  static const int _blackPrimaryValue = 0xFF272727;

  @override
  final Color white = const Color(0xFFFAFAFA);

  @override
  final Color grey = const Color(0xFFDEDEDE);

  @override
  final Color red = const Color(0xFFED1D24);
}
