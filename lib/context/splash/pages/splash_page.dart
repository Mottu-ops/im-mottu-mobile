import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/splash/controller/splash_controller.dart';
import 'package:im_mottu_mobile/core/components/logo/logo.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
      return Scaffold(
        backgroundColor: AppThemes.bgPrimary,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
             
              AnimatedBuilder(
                animation: controller.fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: controller.fadeAnimation.value,
                    child: Image.asset(
                      controller.imagePaths[controller.currentIndex],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                },
              ),
        
              AnimatedBuilder(
                animation: controller.fadeAnimationText,
                builder: (context, child) {
                  return Opacity(
                    opacity: controller.fadeAnimationText.value,
                    child: Hero(tag: "applogo", child: AppLogo.logo()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
