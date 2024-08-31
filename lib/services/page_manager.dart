import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/modules/character/character_bindings.dart';
import 'package:marvel/modules/character/character_list_page.dart';
import 'package:marvel/modules/home/home_bindings.dart';
import 'package:marvel/modules/home/home_page.dart';
import 'package:marvel/modules/sign/sign_start_up_bindings.dart';
import 'package:marvel/modules/sign/sign_start_up_page.dart';
import 'package:marvel/services/constants/app_routes.dart';

List<GetPage> publicPages = [
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: AppRoutes.signStartUpPage,
    page: () => const SignStartUpPage(),
    binding: SignStartUpBindings(),
  ),
  GetPage(
    name: AppRoutes.characterListPage,
    page: () => const CharacterListPage(),
    binding: CharacterBindings(),
  ),
];

List<GetPage> allPages = [...publicPages];

abstract class PageManager {
  static String initialRoute() => AppRoutes.signStartUpPage;
  static List<GetPage> getPages() => allPages;
}
