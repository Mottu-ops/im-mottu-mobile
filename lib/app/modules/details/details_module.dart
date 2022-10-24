import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/details_page.dart';

class DetailsModule extends Module {
  static const String routeName = '/details/';
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => DetailsPage(hero: args.data['hero']),
        ),
      ];
}
