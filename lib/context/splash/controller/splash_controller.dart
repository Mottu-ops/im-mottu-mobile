import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {


  final List<String> imagePaths = [
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
    'assets/images/m3.jpg',
  ];

  int currentIndex = 0;

  Timer? timer;

  late AnimationController fadeController;
  late Animation<double> fadeAnimation;
  late Animation<double> fadeAnimationText;

  void startImageSequence() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      currentIndex = (currentIndex + 1) % imagePaths.length;
      update();
    });

    Future.delayed(const Duration(seconds: 1), () {
      fadeController.forward().then((_) {
        timer?.cancel();
        Get.offAllNamed(AppRoutes.loginPage);
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(fadeController);
    fadeAnimationText = Tween(begin: 0.5, end: 1.0).animate(fadeController);

    startImageSequence();
  }

  @override
  void dispose() {
    timer?.cancel();
    fadeController.dispose();
    super.dispose();
  }
}
