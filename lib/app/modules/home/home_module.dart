import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/modules/home/presentation/home_controller.dart';
import 'package:marvelapp/app/modules/home/presentation/home_page.dart';

class HomeModule extends Module {
  static const String routeName = '/home/';

  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(store: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        )
      ];
}
