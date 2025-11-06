import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/router/app_router.dart';
import 'package:pokeapi/src/core/theme/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.red400,
        primarySwatch: Colors.red,
      ),
    );
  }
}
