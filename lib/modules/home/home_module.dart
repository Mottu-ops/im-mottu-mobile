import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/modules/home/view/home_page.dart';
import 'package:mottu_test/modules/home/view/home_view_list.dart';
import 'package:mottu_test/modules/settings/view/settings_page.dart';

class HomeModule extends Module {
  static const moduleRoute = '/home/';
  static const settings = '/settings';
  static const list = '/home-list';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomePage.route,
            child: (_, __) => const HomePage(),
            transition: TransitionType.fadeIn,
            children: [
              ChildRoute(
                list,
                child: (_, __) => const HomeListView(),
                transition: TransitionType.fadeIn,
              ),
              ChildRoute(
                settings,
                child: (_, __) => const SettingsPage(),
                transition: TransitionType.fadeIn,
              ),
            ]),
      ];
}
