import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/core/components/buttons/buttons.dart';
import 'package:im_mottu_mobile/core/components/logo/logo.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/routes/app_pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: "applogo", child: AppLogo.logo()),
          Padding(
            padding: const EdgeInsets.all(21),
            child: AppText.description(
              textAlign: TextAlign.center,
              text:
                  ' Mergulhe no mundo dos seus heróis favoritos e descubra o Universo Marvel\ncomo nunca antes!',
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          SizedBox(
            width: 250,
            child: AppButtons.buttonSize(
              context: context,
              title: "Entrar",
              onTap: () {
                Get.toNamed(AppRoutes.characterPage);
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AppText.description(
              text: "* Desolvolvido por Lucas Brito", fontSize: 12)
        ],
      ),
    ));
  }
}
