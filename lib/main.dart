import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel/services/locale/app_translations.dart';
import 'package:marvel/services/app_strings.dart';
import 'package:marvel/services/page_manager.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MottuMarvel());
}

class MottuMarvel extends StatelessWidget {
  const MottuMarvel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        AppTranslations.fallbackLocale,
      ],
      defaultTransition: Transition.fadeIn,
      translationsKeys: AppTranslations.translationsKeys,
      fallbackLocale: AppTranslations.fallbackLocale,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: PageManager.getPages(),
      initialRoute: PageManager.initialRoute(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
