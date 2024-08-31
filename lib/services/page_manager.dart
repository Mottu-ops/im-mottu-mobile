import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marvel/modules/home/home_bindings.dart';
import 'package:marvel/modules/home/home_page.dart';
import 'package:marvel/services/app_routes.dart';

List<GetPage> publicPages = [
  GetPage(
    name: AppRoutes.home,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
];

List<GetPage> allPages = [...publicPages];

abstract class PageManager {
  static String initialRoute() => AppRoutes.home;
  static List<GetPage> getPages() => allPages;
}
