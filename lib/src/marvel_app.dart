import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvel_app/src/common/infrastructure/native_methods/native_methods.dart';
import 'package:marvel_app/src/home/views/splash_view.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({super.key});

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  void initState() {
    NativeMethods.startConnectivityListener();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.red,
            surfaceTintColor: Colors.red,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          )),
      home: const SplashView(),
    );
  }
}
