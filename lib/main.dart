import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/firebase_options.dart';
import 'controller/homeBinding.dart';
import 'view/splash.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor color = const MaterialColor(0xFF650e14, <int, Color>{
      50: Color.fromRGBO(101, 14, 20, 0.05),
      100: Color.fromRGBO(101, 14, 20, 0.1),
      200: Color.fromRGBO(101, 14, 20, 0.2),
      300: Color.fromRGBO(101, 14, 20, 0.3),
      400: Color.fromRGBO(101, 14, 20, 0.4),
      500: Color.fromRGBO(101, 14, 20, 0.5),
      600: Color.fromRGBO(101, 14, 20, 0.6),
      700: Color.fromRGBO(101, 14, 20, 0.7),
      800: Color.fromRGBO(101, 14, 20, 0.8),
      900: Color.fromRGBO(101, 14, 20, 0.9),
    });

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: color,
        primarySwatch: color,
        iconTheme: IconThemeData(
          color: color
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: color
          ),
          labelMedium: const TextStyle(
            color: Colors.white
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white70,
          selectedIconTheme: IconThemeData(
            color: color
          ),
          selectedItemColor: color
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: color,
          disabledColor: Colors.grey
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(color)
        ),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.amber,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white
          ),
          labelMedium: TextStyle(
            color: color
          )
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black12,
          selectedIconTheme: IconThemeData(
            color: Colors.amber
          ),
          selectedItemColor: Colors.amber
        ),
        navigationBarTheme: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.amber)),
          indicatorColor: Colors.amber,
          backgroundColor: Colors.white
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.amber,
          disabledColor: Colors.grey
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.amber),
          trackColor: MaterialStateProperty.all(Colors.amber),
        ),
        brightness: Brightness.dark
      ),
      home: const Splash(),
      initialBinding: HomeBinding(),
    );
  }
}
