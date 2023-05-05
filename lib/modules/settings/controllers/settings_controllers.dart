import 'package:flutter_modular/flutter_modular.dart';
import 'package:mottu_test/core/services/prefs_services.dart';
import 'package:mottu_test/modules/login/login_module.dart';

class SettingsController {
  void logout() {
    PrefsServices.logout();
    Future.delayed(const Duration(seconds: 1)).then((value) => Modular.to
        .pushNamedAndRemoveUntil(LoginModule.moduleRoute, (p0) => false));
  }
}
