import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/character/character_controller.dart';
import 'package:marvel/modules/menu/menu_handler.dart';
import 'package:marvel/modules/ui/circular_progress_indicator_ui.dart';
import 'package:marvel/modules/ui/divider_ui.dart';
import 'package:marvel/modules/ui/loading_screen_ui.dart';
import 'package:marvel/modules/ui/scroll_bar_ui.dart';
import 'package:marvel/modules/ui/search_text_field_ui.dart';
import 'package:marvel/constants/app_colors.dart';
import 'package:marvel/services/dimensions.dart';

class CharacterListPage extends GetView<CharacterController> {
  const CharacterListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        backgroundColor: AppColors.redTheme,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          titleSpacing: 10,
          title: Obx(
            () => SearchTextFieldUI(
              controller: controller.textEditingController,
              onChanged: controller.doSearch,
              hintText: "do_search_here".tr,
              loading: controller.fetching,
            ),
          ),
          actions: const [
            MenuHandler(),
          ],
        ),
        body: SafeArea(
          child: Obx(
            () => Visibility(
              visible: controller.items.isEmpty,
              replacement: ScrollBarUI(
                controller: controller.scrollController,
                child: RefreshIndicator(
                  onRefresh: controller.onRefresh,
                  child: Obx(
                    () => ListView.separated(
                      shrinkWrap: false,
                      physics: const ClampingScrollPhysics(),
                      controller: controller.scrollController,
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        Character character = controller.items[index];
                        bool shouldShowLoading =
                            (index + 1) == controller.items.length;
                        return Stack(
                          children: [
                            Positioned(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: InkWell(
                                      onTap: () async {
                                        await controller.detail(character);
                                      },
                                      child: Hero(
                                        tag: character.id,
                                        child: CachedNetworkImage(
                                          width:
                                              Dimensions.widthOf(context, 100),
                                          imageUrl: character.imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: shouldShowLoading &&
                                        controller.searchText.isEmpty,
                                    child: const SizedBox(
                                      height: 15,
                                    ),
                                  ),
                                  Visibility(
                                    visible: shouldShowLoading &&
                                        controller.searchText.isEmpty,
                                    child: Center(
                                      child: CircularProgressIndicatorUI(
                                        color: Colors.amber.shade600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(100),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  character.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteTheme,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0.3, 0.3),
                                        blurRadius: 0.2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: DividerUI(
                          color: AppColors.overlayWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              child: Center(
                child: Obx(
                  () => Visibility(
                    visible: !controller.fetching,
                    replacement: const CircularProgressIndicatorUI(),
                    child: Text(
                      'no_results_found_with'.trParams(
                        {
                          "name": controller.searchText,
                        },
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.whiteTheme,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onLoading: const LoadingScreenUI(),
    );
  }
}
