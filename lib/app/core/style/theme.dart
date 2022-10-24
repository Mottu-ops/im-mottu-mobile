import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvelapp/app/core/style/fonts.dart';

import '../extensions/brightness_extension.dart';
import '../extensions/screen_extension.dart';
import 'colors.dart';

abstract class ThemesMarvel {
  ThemesMarvel._();
  static ThemeData get light {
    return customTheme(
      brightness: Brightness.light,
      primary: ColorsMarvel().red,
      primaryVariant: ColorsMarvel().red,
      onPrimary: ColorsMarvel().red,
      secondary: ColorsMarvel().black,
      secondaryVariant: ColorsMarvel().red,
      onSecondary: ColorsMarvel().white,
      background: ColorsMarvel().white,
      scaffoldBackground: ColorsMarvel().white,
      onBackground: ColorsMarvel().black,
      surface: ColorsMarvel().white,
      onSurface: const Color(0xFFFAF8F8),
      error: ColorsMarvel().red,
      onError: ColorsMarvel().white,
      disabledColor: ColorsMarvel().lightGrey,
      dividerColor: ColorsMarvel().grey,
      dialogBackgroundColor: ColorsMarvel().white,
      bottomNavigationBarBackgroundColor: ColorsMarvel().white,
      inputFillColor: ColorsMarvel().black,
      appBarBackgroundColor: ColorsMarvel().white,
      fontColor: ColorsMarvel().black,
      primarySwatch: ColorsMarvel().black,
    );
  }

  static ThemeData get dark {
    return customTheme(
      brightness: Brightness.dark,
      primary: ColorsMarvel().red,
      primaryVariant: ColorsMarvel().red,
      onPrimary: ColorsMarvel().black,
      secondary: ColorsMarvel().black,
      secondaryVariant: ColorsMarvel().red,
      onSecondary: ColorsMarvel().white,
      background: ColorsMarvel().white,
      scaffoldBackground: ColorsMarvel().black,
      onBackground: ColorsMarvel().white,
      surface: ColorsMarvel().white,
      onSurface: const Color(0xFFFAF8F8),
      error: ColorsMarvel().red,
      onError: ColorsMarvel().black,
      disabledColor: ColorsMarvel().white.withOpacity(.12),
      dividerColor: ColorsMarvel().white.withOpacity(.32),
      dialogBackgroundColor: ColorsMarvel().black.shade50,
      bottomNavigationBarBackgroundColor: ColorsMarvel().black.shade300,
      inputFillColor: ColorsMarvel().black.shade300,
      appBarBackgroundColor: ColorsMarvel().black.shade500,
      fontColor: ColorsMarvel().black,
      primarySwatch: ColorsMarvel().black,
    );
  }

  /// ## customTheme
  ///
  /// [brightness] :
  /// ### Primary
  /// [primary] : The color displayed most frequently across your app’s screens and components.
  ///
  /// [primaryVariant] : A darker version of the primary color.
  ///
  /// [onPrimary] : A color that's clearly legible when drawn on [primary].
  ///
  /// ### Secondary
  /// [secondary] : An accent color that, when used sparingly, calls attention to parts of your app.
  ///
  /// [secondaryVariant] : A darker version of the secondary color.
  ///
  /// [onSecondary] : A color that's clearly legible when drawn on [secondary].
  ///
  /// ### Background
  /// [scaffoldBackground] : A color that appears behind [surface] content (light = white : dark = black).
  ///
  /// [background] : A color that typically appears behind scrollable content (light = blue light : dark = black).
  ///
  /// [onBackground] : A color that's clearly legible when drawn on [background] and [scaffoldBackground].
  ///
  /// ### Surface
  /// [surface] : The background color for widgets like [Card].
  ///
  /// [onSurface] : A color that's clearly legible when drawn on [surface]
  ///
  /// ### Error
  /// [error] : The color to use for input validation errors, e.g. for [InputDecoration.errorText].
  ///
  /// [onError] : A color that's clearly legible when drawn on [error].
  ///
  /// ### Misc
  /// [disabledColor] : A color that appears in disabled components.
  ///
  /// [dividerColor] : A color that appears in strokes and borders to divide content.
  ///
  /// [inputFillColor] : Default color for the fillColor property for textFormFieldWay.
  ///
  /// ### Primary Swatch
  /// [primarySwatch]
  static ThemeData customTheme({
    required Brightness brightness,
    // Primary
    required Color primary,
    required Color primaryVariant,
    required Color onPrimary,
    // Secondary
    required Color secondary,
    required Color secondaryVariant,
    required Color onSecondary,
    // Background
    required Color background,
    required Color scaffoldBackground,
    required Color onBackground,
    // Surface
    required Color surface,
    required Color onSurface,
    // Error
    required Color error,
    required Color onError,
    // Misc
    required Color disabledColor,
    required Color dividerColor,
    required Color dialogBackgroundColor,
    required Color bottomNavigationBarBackgroundColor,
    required Color appBarBackgroundColor,
    required Color inputFillColor,
    required Color fontColor,
    required MaterialColor primarySwatch,
  }) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      primaryColor: primary,
      primaryColorLight:
          brightness.isLight ? primarySwatch.shade50 : primarySwatch.shade900,
      primaryColorDark: primaryVariant,
      backgroundColor: background,
      scaffoldBackgroundColor: scaffoldBackground,
      cardColor: onSurface,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      dialogBackgroundColor: dialogBackgroundColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primary,
        secondary: secondary,
        background: background,
        surface: surface,
        error: error,
        onBackground: onBackground,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onError: onError,
        onSurface: onSurface,
      ),
      fontFamily: FontsMarvel.bebas,
      primaryTextTheme: const TextTheme(),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 98.scale,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: 61.scale,
          fontWeight: FontWeight.w300,
          color: onPrimary,
          letterSpacing: -0.5,
        ),
        headline3: TextStyle(
          fontSize: 49.scale,
          fontWeight: FontWeight.w400,
        ),
        headline4: TextStyle(
          fontSize: 35.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          fontSize: 24.scale,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontSize: 20.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: TextStyle(
          fontSize: 16.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: 14.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: TextStyle(
          fontSize: 16.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: TextStyle(
          fontSize: 14.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: TextStyle(
          fontSize: 14.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: TextStyle(
          fontSize: 12.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: TextStyle(
          fontSize: 10.scale,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        focusColor: primary,
        fillColor: inputFillColor,
        border: InputBorder.none,
        errorStyle: TextStyle(
          color: error,
        ),
        labelStyle: TextStyle(
          color: fontColor.withOpacity(.87),
          fontSize: 16.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: primary,
        backgroundColor: bottomNavigationBarBackgroundColor,
        unselectedItemColor: disabledColor,
        selectedLabelStyle: TextStyle(
          fontFamily: FontsMarvel.bebas,
          fontSize: 12.scale,
          fontWeight: FontWeight.w500,
          color: primary,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: FontsMarvel.bebas,
          fontSize: 12.scale,
          fontWeight: FontWeight.w500,
          color: disabledColor,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.scale),
        ),
        disabledColor: disabledColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        foregroundColor: primary,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 20.scale,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: primary,
          fontFamily: FontsMarvel.bebas,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarBackgroundColor,
          statusBarIconBrightness: brightness.opposite,
          statusBarBrightness: brightness,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(onPrimary),
        fillColor: MaterialStateProperty.all<Color>(primary),
      ),
      iconTheme: IconThemeData(
        color: primary,
        size: 24.scale,
      ),
      primaryIconTheme: IconThemeData(
        color: primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(secondary),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0.scale),
        ),
        elevation: brightness.isLight ? 4.0 : 0.0,
        shadowColor: primary.withOpacity(.2),
        color: surface,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
