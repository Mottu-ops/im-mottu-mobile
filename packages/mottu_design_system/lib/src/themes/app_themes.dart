import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';
import 'package:mottu_design_system/src/themes/mottu_text_style_theme.dart';

var colorLightTheme = MottuColorsTheme.light();
var colorDarkTheme = MottuColorsTheme.dark();

var textLightTheme = MottuTextStyleTheme(colorLightTheme);
var textDarkTheme = MottuTextStyleTheme(colorDarkTheme);

ThemeData get mottuThemeDataLight => ThemeData.light().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        colorLightTheme,
        MottuTextStyleTheme(colorLightTheme),
      ],
    );

ThemeData get mottuThemeDataDark => ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        colorDarkTheme,
        MottuTextStyleTheme(colorDarkTheme),
      ],
    );

Iterable<ThemeExtension<dynamic>> lightThemeExtensions = [
  colorLightTheme,
  textLightTheme,
];

Iterable<ThemeExtension<dynamic>> darkThemeExtensions = [
  colorDarkTheme,
  textDarkTheme,
];
