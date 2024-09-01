import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/modules/character/character_controller.dart';
import 'package:marvel/modules/character/character_list.dart';
import 'package:marvel/modules/character/character_suggestions.dart';
import 'package:marvel/modules/ui/loading_screen_ui.dart';
import 'package:marvel/services/constants/app_colors.dart';

class CharacterListPage extends GetView<CharacterController> {
  const CharacterListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        backgroundColor: AppColors.redTheme,
        body: SafeArea(
          child: Column(
            children: [
              CharacterSuggestions(
                controller: controller,
                textEditingController: controller.textEditingController,
                onCharacterTap: controller.detail,
              ),
              CharacterList(
                scrollController: controller.scrollController,
                onRefresh: controller.onRefresh,
                characters: controller.items,
                onCharacterTap: controller.detail,
              ),
            ],
          ),
        ),
      ),
      onLoading: const LoadingScreenUI(),
    );
  }
}
