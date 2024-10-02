import 'package:get/get.dart';
import 'package:mottu_marvel/modules/splash/presentation/pages/splash_page.dart';

class SplashRouteNames {
  static const SPLASH = '/splash';
}

class SplashPagesRoutes {
  static final routes = [
    GetPage(
      name: SplashRouteNames.SPLASH,
      page: () => const SplashPage(),
    ),
  ];
}
