import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/modules/splash/presentation/controller/splash_controller.dart';
import 'package:marvelapp/app/modules/splash/presentation/splash_page.dart';

class SplashModule extends Module {
  static const String routeName = '/splash/';
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SplashController(
            getHeroesFromServerUsecase: i(),
            store: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        )
      ];
}
