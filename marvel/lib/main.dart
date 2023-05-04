import 'package:flutter/material.dart';
import 'package:marvel/di/di.dart';
import 'package:marvel/presentation/router/routes.dart';
import 'package:marvel/presentation/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const SplashView());

  Future.delayed(const Duration(milliseconds: 6000))
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.black12,
          selectionHandleColor: Color(0XFFED1D24),
        ),
      ),
      title: 'Mottul Marvel',
    );
  }
}
