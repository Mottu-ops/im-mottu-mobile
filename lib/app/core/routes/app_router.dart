import 'package:mottu_marvel/app/core/routes/constants_routes.dart';
import 'package:mottu_marvel/app/presentation/details/details_page.dart';
import 'package:mottu_marvel/app/presentation/home/home_page.dart';
import 'package:mottu_marvel/app/presentation/initial/initial_page.dart';

class AppRouter {
  static final routes = {
    INITIAL_ROUTE: (context) => const InitialPage(),
    HOME_ROUTE: (context) => const HomePage(),
    DETAILS_ROUTE: (context) => const DetailsPage(),
  };
}
