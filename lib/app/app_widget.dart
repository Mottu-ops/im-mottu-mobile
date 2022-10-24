// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/app_module.dart';
import 'package:marvelapp/app/core/style/theme.dart';

import 'core/screen/design_ui.dart';
import 'core/screen/screen_util.dart';

class AppWidget extends StatelessWidget {
  const AppWidget();

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppModule.routeName);
    return ScreenUtil.builder(
      designUI: DesignUI.androidMaterial,
      designUITablet: DesignUI.androidMaterial,
      builder: (context, constraints, orientation) {
        return Observer(
          builder: (context) {
            return MaterialApp.router(
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              debugShowCheckedModeBanner: false,
              title: 'Marvel App',
              builder: (context, child) {
                final ThemeData theme = Theme.of(context);
                return SafeArea(
                  child: Scaffold(
                    backgroundColor: theme.backgroundColor,
                    body: child,
                  ),
                );
              },
              theme: ThemesMarvel.light,
            );
          },
        );
      },
    );
  }
}
