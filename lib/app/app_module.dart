import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/modules/details_page/details_module.dart';
import 'package:mottu_test/modules/home/controller/home_getx.dart';
import 'package:mottu_test/modules/home/home_module.dart';
import 'package:mottu_test/modules/login/login_module.dart';
import 'package:mottu_test/modules/settings/widgets/settings_module.dart';
import 'package:mottu_test/modules/splash/view/splash_page.dart';

class AppModule extends Module {
  List<Bind<Object>> get binds => [
        Bind((i) => HomeGetx()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const SplashPage(),
        ),
        ModuleRoute(
          HomeModule.moduleRoute,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          HomeModule.list,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          DetailsModule.moduleRoute,
          module: DetailsModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          LoginModule.moduleRoute,
          module: LoginModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          SettingsModule.moduleRoute,
          module: SettingsModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
