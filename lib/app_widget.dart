import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/core/constants/app_routes.dart';
import 'package:im_mottu_mobile/core/constants/contants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: appRoutes,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
