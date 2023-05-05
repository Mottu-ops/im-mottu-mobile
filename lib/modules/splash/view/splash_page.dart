import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mottu_test/core/themes/app_images.dart';
import 'package:mottu_test/modules/splash/controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    super.initState();
    controller.initSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppImages.animaitionSplash,
        height: 300,
        width: 300,
      ),
    );
  }
}
