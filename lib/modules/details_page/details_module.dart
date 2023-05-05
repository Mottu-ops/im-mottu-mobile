import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/modules/details_page/controller/details_controller.dart';
import 'package:mottu_test/modules/details_page/view/details_page.dart';

class DetailsModule extends Module {
  static const moduleRoute = '/details-page${DetailPage.route}';

  @override
  List<Bind<Object>> get binds => [Bind.factory((i) => DetailsController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          DetailPage.route,
          child: (context, args) => DetailPage(
            movie: args.data,
            controller: DetailsController(),
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
