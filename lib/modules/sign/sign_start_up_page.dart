import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/modules/sign/sign_start_up_controller.dart';
import 'package:marvel/modules/ui/scaffold_extend_body_ui.dart';
import 'package:marvel/services/constants/app_images.dart';
import 'package:marvel/services/dimensions.dart';

class SignStartUpPage extends GetView<SignStartUpController> {
  const SignStartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldExtendBodyUI(
      backgroundColor: const Color.fromRGBO(220, 45, 45, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Visibility(
                  visible: controller.shouldAnimate,
                  replacement: Image.asset(
                    AppImages.marvelLogo,
                    fit: BoxFit.cover,
                  ),
                  child: Image.asset(
                    AppImages.marvelLogoGif,
                    fit: BoxFit.cover,
                  ),
                ),
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
                          color: Colors.white,
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
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onTap: controller.join,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
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
                            color: Colors.white,
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
