import 'package:im_mottu_mobile/context/character/page/character_page.dart';
import 'package:im_mottu_mobile/context/home/page/home_page.dart';
import 'package:im_mottu_mobile/context/login/page/login_page.dart';
import 'package:im_mottu_mobile/context/splash/pages/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splashPage,
        page: () => const SplashPage(),
        transition: Transition.upToDown),
    GetPage(
        name: AppRoutes.characterPage,
        page: () => const CharacterPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => const LoginPage(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),
        transition: Transition.rightToLeft),
  ];
}
