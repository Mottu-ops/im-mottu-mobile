import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel/modules/home/home_controller.dart';
import 'package:marvel/services/app_strings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Text(AppStrings.appName),
    );
  }
}
