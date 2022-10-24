import 'package:flutter/material.dart';

extension BrightnessExtension on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;

  Brightness get opposite => isDark ? Brightness.light : Brightness.dark;
}
