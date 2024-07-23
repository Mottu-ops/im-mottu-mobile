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
        // textTheme: const TextTheme(
        //   bodyLarge: TextStyle(color: Colors.white),
        //   bodyMedium: TextStyle(color: Colors.white),
        //   displayLarge: TextStyle(color: Colors.white),
        //   displayMedium: TextStyle(color: Colors.white),
        //   displaySmall: TextStyle(color: Colors.white),
        //   headlineMedium: TextStyle(color: Colors.white),
        //   headlineSmall: TextStyle(color: Colors.white),
        //   titleLarge: TextStyle(color: Colors.white),
        //   titleMedium: TextStyle(color: Colors.white),
        //   titleSmall: TextStyle(color: Colors.white),
        //   bodySmall: TextStyle(color: Colors.white),
        //   labelLarge: TextStyle(color: Colors.white),
        //   labelSmall: TextStyle(color: Colors.white),
        //   labelMedium: TextStyle(color: Colors.white),
        // ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            iconColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
      );
}
