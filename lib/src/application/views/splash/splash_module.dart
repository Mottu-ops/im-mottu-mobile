import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mottu_marvel/src/application/bindings/splash/splash_bindings.dart';
import 'package:mottu_marvel/src/application/modules/module.dart';
import 'package:mottu_marvel/src/application/views/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
