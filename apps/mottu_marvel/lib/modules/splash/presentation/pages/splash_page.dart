import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu_design_system/mottu_design_system.dart';
import 'package:mottu_marvel/modules/splash/presentation/pages/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<MottuColorsTheme>()!;

    return Scaffold(
      body: Container(
        width: Get.size.width,
        height: Get.size.height,
        decoration: BoxDecoration(
          color: colors.backgroundPrimary,
        ),
        child: GetX<SplashPageController>(
          init: SplashPageController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _SplashScreenLogo(
                  size: 150,
                  asset: 'assets/images/marvelLogo.png',
                ),
                const _SplashScreenLogo(
                  size: 150,
                  asset: 'assets/images/mottuLogo.png',
                ),
                MottuHeading1Text.regular('${controller.loadingStatus.value}%')
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SplashScreenLogo extends StatelessWidget {
  const _SplashScreenLogo({
    super.key,
    required this.asset,
    required this.size,
  });

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(asset),
    );
  }
}
