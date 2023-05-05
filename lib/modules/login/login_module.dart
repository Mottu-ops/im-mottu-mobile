import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/modules/login/controllers/login_get_controller.dart';
import 'package:mottu_test/modules/login/view/login_page.dart';

class LoginModule extends Module {
  static const moduleRoute = '/login/';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginPage.route,
          child: (_, __) => LoginPage(
            controller: LoginGetController(),
          ),
          transition: TransitionType.fadeIn,
        ),
      ];
}
