import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Get.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Image.network(
            'https://media.giphy.com/avatars/marvel/4IT2uG6Wq1ia.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
