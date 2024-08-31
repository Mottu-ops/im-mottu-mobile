import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/character/character_controller.dart';
import 'package:marvel/modules/ui/circular_progress_indicator_ui.dart';
import 'package:marvel/modules/ui/loading_screen_ui.dart';
import 'package:marvel/modules/ui/scroll_bar_ui.dart';
import 'package:marvel/services/dimensions.dart';

class CharacterListPage extends GetView<CharacterController> {
  const CharacterListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        backgroundColor: Colors.red.shade800,
        body: SafeArea(
          child: ScrollBarUI(
            controller: controller.scrollController,
            child: RefreshIndicator(
              onRefresh: controller.onRefresh,
              child: Obx(
                () => ListView.separated(
                  shrinkWrap: false,
                  physics: const ClampingScrollPhysics(),
                  controller: controller.scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
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
                                child: CachedNetworkImage(
                                  width: Dimensions.widthOf(context, 100),
                                  imageUrl: character.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Visibility(
                                visible: shouldShowLoading,
                                child: const SizedBox(
                                  height: 15,
                                ),
                              ),
                              Visibility(
                                visible: shouldShowLoading,
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
                                color: Colors.white,
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
                    child: Divider(),
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
