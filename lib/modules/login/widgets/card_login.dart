import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_images.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Image.asset(AppImages.logoGif),
    );
  }
}
