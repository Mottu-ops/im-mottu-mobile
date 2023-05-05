import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_test/modules/login/controllers/login_get_controller.dart';
import 'package:mottu_test/modules/login/widgets/login_field.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginGetController>(
        init: LoginGetController(),
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: LoginField(
                  hint: 'Email',
                  onChanged: context.setEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: LoginField(
                  hint: 'Password',
                  onChanged: context.setPassword,
                ),
              )
            ],
          );
        });
  }
}
