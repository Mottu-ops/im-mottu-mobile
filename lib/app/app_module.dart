import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/modules/home/home_module.dart';
import 'package:marvelapp/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  static const String routeName = SplashModule.routeName;
  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(SplashModule.routeName, module: SplashModule()),
        ModuleRoute(HomeModule.routeName, module: HomeModule()),
      ];
}
