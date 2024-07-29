import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryRegular = Color(0xffdb0825);

  //Secondary Colors
  static const Color secundaryDarker = Color(0xFF655209);
  static const Color secundaryDark = Color(0xFFCCA615);
  static const Color secundaryRegular = Color(0xFFffb101);
  // static const Color secundaryRegular = Color(0xFFFFCB03);
  static Color secundaryLight = const Color(0xFFFFCB03).withOpacity(0.60);
  static Color secundaryLightest = const Color(0xFFFFCB03).withOpacity(0.30);
  static Color transparent =  Colors.transparent;

  //Neutral Colors
  static const Color greyDarkest2 = Color.fromARGB(255, 39, 39, 39);
  static const Color greyDarkest = Color(0xFF363636);
  static const Color greyDarker = Color(0xFF666666);
  static const Color greyDark = Color(0xFFABABAB);
  static const Color greyRegular = Color(0xFFC7C7C7);
  static const Color greyLight = Color(0xFFE6E6E6);
  static const Color greyLightest = Color(0xFFF2F2F2);
  static const Color greyLightestMore = Color.fromARGB(255, 247, 247, 247);
  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF1a1a1a);
  static Color white75 = const Color(0xFFFFFFFF).withOpacity(0.75);
  static Color white50 = const Color(0xFFFFFFFF).withOpacity(0.50);
  static Color white25 = const Color(0xFFFFFFFF).withOpacity(0.25);

  //Return Colors
  static const Color successDark = Color(0xFF458723);
  static const Color successRegular = Color(0xFF63C132);
  static Color successLightest = const Color(0xFF63C132).withOpacity(0.30);
  static Color successLight = const Color(0xFF63C132).withOpacity(0.60);
  static const Color errorDark = Color(0xFF630515);
  static const Color errorRegular = Color(0xFFF50D35);
  static Color errorLight = const Color(0xFFF50D35).withOpacity(0.60);
  static Color errorLightest = const Color(0xFFF50D35).withOpacity(0.30);
  static const Color warningDark = Color(0xFFCC8645);
  static const Color warningRegular = Color(0xFFFFA756);
  static Color warningLight = const Color(0xFFFFA756).withOpacity(0.60);
  static Color warningLightest = const Color(0xFFFFA756).withOpacity(0.30);

  //Text Colors
  static Color get title => white;
  static Color get textPrimary => white;
  static Color get textSecundary => white;

  //Icons
  static const Color iconInteractionPrimary = primaryRegular;
  static const Color iconInteractionSecundary = secundaryRegular;
  static Color get iconPrimary => greyLightest;
  static Color get iconCategory => greyLightest;
  static const Color iconSecunday = greyLightestMore;

  //Bgs
  static Color get bgPrimary => const Color.fromARGB(255, 0, 0, 0);
  static Color get bgSecundary => const Color(0xFF1c1c1c);
  static Color get bgTerciary => const Color.fromARGB(255, 62, 62, 63);
  static Color get bgCard => const Color(0xFF1c1c1c);
  static Color get bgMarvel => primaryRegular;

  ///btn
  static const Color buttonEnablePrimary = primaryRegular;
  static const Color buttonEnableSecundary = secundaryRegular;
  static const Color buttonDisable = greyLight;

  static String font1 = "Bebas";

  static final ThemeData darkTheme = ThemeData(
      primaryColor: primaryRegular,
      scaffoldBackgroundColor: bgPrimary,
      brightness: Brightness.dark,
  
      appBarTheme: AppBarTheme(backgroundColor: bgSecundary),
      iconTheme: const IconThemeData(color: white),
      cardColor: bgSecundary,
      cardTheme: CardTheme(color: bgSecundary));
}
