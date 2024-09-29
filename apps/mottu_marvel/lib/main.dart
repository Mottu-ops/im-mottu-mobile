import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_marvel/characters/presentation/routes.dart';
import 'package:mottu_marvel/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mottu - Marvel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: CharactersRouteNames.HOME,
      getPages: marvelPages,
    );
  }
}
