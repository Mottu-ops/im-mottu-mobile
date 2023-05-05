import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_images.dart';

class LoaderDetail extends StatelessWidget {
  const LoaderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 43, 45, 1),
      body: Hero(
        tag: Image.asset(AppImages.logoGif),
        child: Center(
          child: Image.asset(
            AppImages.logoGif,
          ),
        ),
      ),
    );
  }
}
