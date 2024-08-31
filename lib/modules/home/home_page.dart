import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel/modules/home/home_controller.dart';
import 'package:marvel/modules/ui/loading_screen_ui.dart';
import 'package:marvel/modules/ui/scaffold_extend_body_ui.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ScaffoldExtendBodyUI(
        backgroundColor: Colors.red.shade800,
        body: const LoadingScreenUI(),
      ),
      onLoading: const LoadingScreenUI(),
    );
  }
}
