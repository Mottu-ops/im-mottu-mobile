import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel/modules/sign/sign_start_up_controller.dart';
import 'package:marvel/modules/ui/loading_screen_ui.dart';
import 'package:marvel/modules/ui/scaffold_extend_body_ui.dart';
import 'package:marvel/services/constants/app_images.dart';

class SignStartUpPage extends GetView<SignStartUpController> {
  const SignStartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ScaffoldExtendBodyUI(
        backgroundColor: Color.fromRGBO(220, 45, 45, 1),
        body: Image.asset(
          AppImages.marvelLogoGif,
          fit: BoxFit.cover,
          // width: Dimensions.widthOf(context, 100),
          // height: Dimensions.heightOf(context, 100),
        ),
      ),
      onLoading: const LoadingScreenUI(),
    );
  }
}
