import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/constants/app_enumators.dart';
import 'package:marvel/modules/sign/sign_start_up_controller.dart';
import 'package:marvel/modules/ui/scaffold_extend_body_ui.dart';
import 'package:marvel/constants/app_colors.dart';
import 'package:marvel/constants/app_images.dart';
import 'package:marvel/services/dimensions.dart';

class SignStartUpPage extends GetView<SignStartUpController> {
  const SignStartUpPage({super.key});

  Widget marvelAnimationRender(StartUpAnimationStatusType animationStatusType) {
    switch (animationStatusType) {
      case StartUpAnimationStatusType.started:
        return Image.asset(
          AppImages.marvelLogoGif,
          fit: BoxFit.cover,
        );
      case StartUpAnimationStatusType.completed:
        return const SizedBox();
      default:
        return Image.asset(
          AppImages.marvelLogo,
          fit: BoxFit.cover,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldExtendBodyUI(
      backgroundColor: AppColors.redTheme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => marvelAnimationRender(controller.animationStatusType),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Switch(
                          value: controller.autoSignIn,
                          overlayColor:
                              const WidgetStatePropertyAll<Color>(Colors.amber),
                          trackColor: WidgetStatePropertyAll<Color>(
                              controller.autoSignIn
                                  ? Colors.amber
                                  : Colors.grey.shade300),
                          thumbColor:
                              const WidgetStatePropertyAll<Color>(Colors.black),
                          onChanged: (bool autoSignIn) =>
                              controller.autoSignIn = autoSignIn,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'auto_join'.tr.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.whiteTheme,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    overlayColor: WidgetStatePropertyAll<Color>(
                        Colors.amber.withAlpha(100)),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: AppColors.whiteTheme, width: 3),
                    ),
                    onTap: controller.join,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.whiteTheme,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      width: Dimensions.widthOf(context, 90),
                      height: 60,
                      child: Center(
                        child: Text(
                          'join'.tr.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.whiteTheme,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
