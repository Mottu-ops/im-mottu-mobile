import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/modules/settings/view/settings_page.dart';

class SettingsModule extends Module {
  static const moduleRoute = '/settings/';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SettingsPage.route,
          child: (_, __) => const SettingsPage(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
