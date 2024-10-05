import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/atomic/atoms/text/mottu_font_family.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';
import 'package:mottu_design_system/src/themes/mottu_text_style_theme.dart';

var colorLightTheme = MottuColorsTheme.light();
var colorDarkTheme = MottuColorsTheme.dark();

var textLightTheme = MottuTextStyleTheme(colorLightTheme);
var textDarkTheme = MottuTextStyleTheme(colorDarkTheme);

Iterable<ThemeExtension<dynamic>> lightThemeExtensions = [
  colorLightTheme,
  textLightTheme,
];

Iterable<ThemeExtension<dynamic>> darkThemeExtensions = [
  colorDarkTheme,
  textDarkTheme,
];

ThemeData get mottuThemeLight => _buildTheme(
      ThemeData.light(),
      MottuColorsTheme.light(),
    );

ThemeData get mottuThemeDark => _buildTheme(
      ThemeData.dark(),
      MottuColorsTheme.dark(),
    );

ThemeData _buildTheme(ThemeData theme, MottuColorsTheme colorsTheme) {
  return theme.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      colorsTheme,
      MottuTextStyleTheme(colorsTheme),
    ],
  );
}
