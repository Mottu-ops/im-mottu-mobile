import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvelapp/app/modules/home/home_page.dart';

class HomeModule extends Module {
  static const String routeName = '/home/';

  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        )
      ];
}
