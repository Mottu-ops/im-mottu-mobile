import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';
import 'package:mottu_test/core/services/prefs_services.dart';
import 'package:mottu_test/core/services/snacks_bar.dart';
import 'package:mottu_test/modules/home/home_module.dart';

class LoginGetController extends GetxController {
  Rx<String> email = ''.obs;
  setEmail(String value) => email.value = value;

  Rx<String> password = "".obs;
  setPassword(String value) => password.value = value;

  var inLoader = false.obs;

  Future<bool> auth() async {
    inLoader.value = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    update();
    inLoader.value = false;

    if (email.value == 'adm' && password.value == '123') {
      PrefsServices.save(email.value);
      update();

      return true;
    }
    update();
    return false;
  }

  void validate(BuildContext context) {
    auth().then(
      (value) {
        if (value) {
          Modular.to.pushNamed(HomeModule.moduleRoute);
        } else {
          SnackBarServices.showErrorSnackbar(context, 'Algo deu errado');
        }
      },
    );
  }
}
