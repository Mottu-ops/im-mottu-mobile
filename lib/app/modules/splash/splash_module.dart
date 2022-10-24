import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/modules/splash/presentation/splash_page.dart';

class SplashModule extends Module {
  static const String routeName = '/splash/';
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        )
      ];
}
