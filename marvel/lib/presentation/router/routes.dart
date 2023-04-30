import 'package:go_router/go_router.dart';
import 'package:marvel/core/enum/routes_enum.dart';
import 'package:marvel/presentation/home/view/home_page.dart';

class Routes {
  static final GoRouter goRouter = GoRouter(
    initialLocation: RoutesEmum.home.path,
    routes: [
      GoRoute(
        path: RoutesEmum.home.path,
        builder: (context, state) => const HomePage(),
      )
    ],
  );
}
