import 'package:flutter/material.dart';

abstract class MottuColors {
  static const white = Colors.white;
  static const black = Colors.black;
}

typedef _MC = MottuColors;

class MottuColorsTheme extends ThemeExtension<MottuColorsTheme> {
  const MottuColorsTheme._({
    required this.backgroundDefault,
    required this.backgroundSecondary,
    required this.defaultText,
  });

  factory MottuColorsTheme.light() {
    return const MottuColorsTheme._(
      backgroundDefault: _MC.white,
      backgroundSecondary: _MC.black,
      defaultText: _MC.black,
    );
  }

  factory MottuColorsTheme.dark() {
    return const MottuColorsTheme._(
      backgroundDefault: _MC.black,
      backgroundSecondary: _MC.white,
      defaultText: _MC.white,
    );
  }

  final Color backgroundDefault;
  final Color backgroundSecondary;
  final Color defaultText;

  @override
  ThemeExtension<MottuColorsTheme> copyWith([bool isLightMode = true]) {
    if (isLightMode) return MottuColorsTheme.light();

    return MottuColorsTheme.dark();
  }

  @override
  ThemeExtension<MottuColorsTheme> lerp(covariant ThemeExtension<MottuColorsTheme>? other, double t) => this;
}
