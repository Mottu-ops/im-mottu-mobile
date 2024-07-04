import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_controller.dart';
import 'package:marvel_app/src/modules/characters/pages/person/person_page.dart';

class PersonModule extends Module {
  @override
  void binds(i) {
    i.addInstance<PersonController>(
      PersonController(
        charactersController: Modular.get(),
        httpClient: Modular.get(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/:id',
      child: (_) => PersonPage(
        id: r.args.params['id'],
      ),
    );
  }
}
