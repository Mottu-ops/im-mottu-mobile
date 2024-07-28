import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:im_mottu_mobile/core/themes/theme_controller.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:im_mottu_mobile/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black, // Cor do fundo da barra de status
    statusBarIconBrightness:
        Brightness.light, // Cor dos ícones da barra de status
    statusBarBrightness: Brightness.dark, // Para iOS
  ));

  Get.put(ThemeController());
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.splashPage,
      locale: const Locale('pt', 'BR'),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      title: 'Mottu Marvel',
    ),
  );
}
