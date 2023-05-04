import 'package:go_router/go_router.dart';
import 'package:marvel/core/enum/routes_enum.dart';
import 'package:marvel/domain/entities/characters/characters.dart';
import 'package:marvel/presentation/details/view/details_page.dart';
import 'package:marvel/presentation/home/view/home_page.dart';

class Routes {
  static final GoRouter goRouter = GoRouter(
    initialLocation: RoutesEmum.home.path,
    routes: [
      GoRoute(
        name: RoutesEmum.home.name,
        path: RoutesEmum.home.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
          name: RoutesEmum.details.name,
          path: RoutesEmum.details.path,
          builder: (context, state) {
            final CharactersEntity extra = state.extra as CharactersEntity;
            return DetailsPage(
              charactersEntity: extra,
            );
          }),
    ],
  );
}
