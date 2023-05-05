import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/login/controllers/login_get_controller.dart';

class LoginButton extends StatelessWidget {
  final LoginGetController controller;
  const LoginButton({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginGetController>(
      init: LoginGetController(),
      builder: (_) => _.inLoader.value
          ? const CircularProgressIndicator()
          : GestureDetector(
              onTap: () {
                _.validate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.defaultWhite,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: size.height * 0.06,
                width: size.width * 0.35,
                child: Center(
                  child: Text(
                    'Enter'.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.defaultBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
