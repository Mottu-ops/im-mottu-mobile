import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/constants/app_enumators.dart';
import 'package:marvel/modules/ui/divider_ui.dart';
import 'package:marvel/constants/app_colors.dart';
import 'package:marvel/services/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuHandler extends StatelessWidget with GetxServiceMixin {
  const MenuHandler({super.key});

  Future<void> handleSignOut() async {
    Get.back();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.back();
  }

  Future<void> handleMenuAction(MenuType menuType) async {
    switch (menuType) {
      case MenuType.signout:
        await handleSignOut();
        break;
      case MenuType.close:
        Get.back();
        break;
      default:
    }
  }

  Widget menuItemsRender() => Column(
        children: MenuType.values
            .map(
              (menuType) => Column(
                children: [
                  const DividerUI(),
                  InkWell(
                    overlayColor: WidgetStatePropertyAll<Color>(
                        Colors.amber.withAlpha(80)),
                    onTap: () async {
                      await handleMenuAction(menuType);
                    },
                    child: SizedBox(
                      width: Dimensions.widthOf(Get.context, 100),
                      height: 60,
                      child: Center(
                        child: Text(
                          menuType.name.tr.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.greyFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      );

  Widget bottomSheetBodyRender() => SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.drag_handle_rounded,
                  size: 30,
                  color: Colors.amber,
                  shadows: [
                    Shadow(
                      offset: Offset(0.1, 0.1),
                      blurRadius: 1.0,
                      color: AppColors.greyFont,
                    )
                  ],
                ),
              ],
            ),
            menuItemsRender(),
          ],
        ),
      );

  Future<dynamic> handleSimpleBottomSheet() async {
    return Get.bottomSheet(
      useRootNavigator: true,
      bottomSheetBodyRender(),
      backgroundColor: AppColors.whiteTheme,
      barrierColor: AppColors.overlay,
      isDismissible: true,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: BorderSide.none,
      ),
      enableDrag: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.whiteTheme,
      icon: const Icon(Icons.menu),
      onPressed: () async {
        await handleSimpleBottomSheet();
      },
    );
  }
}
