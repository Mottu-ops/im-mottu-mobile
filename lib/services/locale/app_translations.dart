import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:marvel/services/locale/pt_br.dart';

abstract class AppTranslations {
  static Map<String, Map<String, String>> translationsKeys = {
    "pt_BR": ptBR,
  };

  static Locale fallbackLocale = const Locale('pt', 'BR');

  static Locale get locale {
    try {
      Locale locale =
          Get.locale != null ? Get.locale! : AppTranslations.fallbackLocale;
      if (locale.toString() == "pt_US") {
        return AppTranslations.fallbackLocale;
      }
      return locale;
    } catch (e) {
      return AppTranslations.fallbackLocale;
    }
  }

  static String get localeStr => AppTranslations.locale.toString();
}
