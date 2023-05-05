import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/core/services/prefs_services.dart';
import 'package:mottu_test/modules/home/home_module.dart';
import 'package:mottu_test/modules/login/login_module.dart';

class SplashController {
  Future<void> initSplash() {
    return Future.wait([PrefsServices.isAuth()]).then(
      (value) => value[0]
          ? Future.delayed(const Duration(seconds: 3))
              .then((value) => Modular.to.pushNamed(HomeModule.moduleRoute))
          : Future.delayed(const Duration(seconds: 3)).then(
              (value) => Modular.to.pushNamed(LoginModule.moduleRoute),
            ),
    );
  }
}
