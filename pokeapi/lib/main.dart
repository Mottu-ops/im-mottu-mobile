import 'package:flutter/material.dart';
import 'package:pokeapi/src/app_widget.dart';
import 'package:pokeapi/src/core/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  runApp(const AppWidget());
}
