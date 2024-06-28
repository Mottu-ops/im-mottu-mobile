import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'Marvel App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}