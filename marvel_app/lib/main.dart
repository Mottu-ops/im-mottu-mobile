import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app_module.dart';
import 'package:marvel_app/src/app_page.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppPage(),
    ),
  );
}
