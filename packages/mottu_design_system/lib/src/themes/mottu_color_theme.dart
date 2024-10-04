import 'package:flutter/material.dart';

abstract class MottuColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const blackMedium = Colors.black54;
}

typedef _MC = MottuColors;

class MottuColorsTheme extends ThemeExtension<MottuColorsTheme> {
  const MottuColorsTheme._({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.textSecondary,
  });

  factory MottuColorsTheme.light() {
    return const MottuColorsTheme._(
      backgroundPrimary: _MC.white,
      backgroundSecondary: _MC.black,
      textPrimary: _MC.black,
      textSecondary: _MC.white,
    );
  }

  factory MottuColorsTheme.dark() {
    return const MottuColorsTheme._(
      backgroundPrimary: _MC.black,
      backgroundSecondary: _MC.white,
      textPrimary: _MC.white,
      textSecondary: _MC.black,
    );
  }

  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color textPrimary;
  final Color textSecondary;

  @override
  ThemeExtension<MottuColorsTheme> copyWith([bool isLightMode = true]) {
    if (isLightMode) return MottuColorsTheme.light();

    return MottuColorsTheme.dark();
  }

  @override
  ThemeExtension<MottuColorsTheme> lerp(covariant ThemeExtension<MottuColorsTheme>? other, double t) {
    if (other is! MottuColorsTheme) {
      return this;
    }

    return MottuColorsTheme._(
      backgroundPrimary: Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}
