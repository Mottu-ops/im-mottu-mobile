import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_flutter/app/app_store.dart';

import 'injector.dart';
import 'routers.dart';
import 'shared/services/theme/theme_app_state.dart';
import 'shared/services/theme/theme_app_store.dart';
// import 'routes.dart.bak';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final ThemeAppStore themeStore = injector.get<ThemeAppStore>();
  final AppStore appStore = injector.get<AppStore>();
  @override
  void initState() {
    super.initState();
    appStore.getThemeApp();
    themeStore.addListener(() {
      appStore.updateTheme(themeStore.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color.fromARGB(255, 36, 129, 172);
    Brightness selectedBrightness = Brightness.light;

    return GetMaterialApp.router(
      title: 'Mottu-Marvel',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: selectedColor,
        brightness: selectedBrightness,
      )),
      builder: (context, child) => GetBuilder<AppStore>(
        init: appStore,
        builder: (controller) => Theme(
            data: ThemeData(
                colorScheme: ColorScheme.fromSeed(
              seedColor: selectedColor,
              brightness:
                  controller.state.themeState.theme == ThemeEnum.lightTheme ? Brightness.light : Brightness.dark,
            )),
            child: child ?? const SizedBox.shrink()),
      ),
      routeInformationParser: Routers.router.routeInformationParser,
      routerDelegate: Routers.router.routerDelegate,
      routeInformationProvider: Routers.router.routeInformationProvider,
    );
  }
}
