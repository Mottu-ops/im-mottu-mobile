import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/login/controllers/login_get_controller.dart';
import 'package:mottu_test/modules/login/widgets/card_login.dart';
import 'package:mottu_test/modules/login/widgets/login_button.dart';
import 'package:mottu_test/modules/login/widgets/login_inputs.dart';

class LoginPage extends StatelessWidget {
  final LoginGetController controller;

  const LoginPage({required this.controller, super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultRed,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginCard(),
            const LoginInputs(),
            LoginButton(controller: controller)
          ],
        ),
      ),
    );
  }
}
