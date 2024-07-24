import 'package:flutter/material.dart';

class AppUiConfig {
  AppUiConfig._();

  static String get title => 'Marvel App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Oswald',
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            iconColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
      );
}
