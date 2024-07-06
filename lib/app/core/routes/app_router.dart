import 'package:mottu_marvel/app/core/routes/constants_routes.dart';
import 'package:mottu_marvel/app/presentation/details/pages/details_page.dart';
import 'package:mottu_marvel/app/presentation/home/pages/home_page.dart';
import 'package:mottu_marvel/app/presentation/initial/pages/initial_page.dart';

class AppRouter {
  static final routes = {
    INITIAL_ROUTE: (context) => const InitialPage(),
    HOME_ROUTE: (context) => const HomePage(),
    DETAILS_ROUTE: (context) => const DetailsPage(),
  };
}
