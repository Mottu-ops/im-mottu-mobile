import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/atomic/atoms/text/mottu_font_family.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';

class MottuTextStyleTheme extends ThemeExtension<MottuTextStyleTheme> {
  factory MottuTextStyleTheme(MottuColorsTheme mottuColorsTheme) {
    TextStyle createStyle({
      required double size,
      required double height,
      Color? color,
      MottuFontFamily fontFamily = MottuFontFamily.roboto,
      FontWeight? fontWeight,
      double? letterSpacing,
    }) {
      return TextStyle(
        fontSize: size,
        color: color ?? mottuColorsTheme.defaultText,
        fontFamily: fontFamily.name,
        package: 'design_system',
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
    }

    final heading1 = createStyle(size: 37.0, height: 45.0);
    final heading2 = createStyle(size: 32.0, height: 35.0);
    final body1 = createStyle(size: 14.0, height: 20.0);

    return MottuTextStyleTheme._(
      heading1: heading1,
      heading2: heading2,
      body1: body1,
    );
  }

  MottuTextStyleTheme._({
    required this.heading1,
    required this.heading2,
    required this.body1,
  });

  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle body1;

  @override
  ThemeExtension<MottuTextStyleTheme> copyWith({MottuColorsTheme? colors}) {
    return colors != null ? MottuTextStyleTheme(colors) : this;
  }

  @override
  ThemeExtension<MottuTextStyleTheme> lerp(
    ThemeExtension<MottuTextStyleTheme>? other,
    double t,
  ) {
    return this;
  }
}

extension BoldExtension on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
