import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/ui/scaffold_extend_body_ui.dart';
import 'package:marvel/constants/app_colors.dart';
import 'package:marvel/services/dimensions.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({
    super.key,
    required this.character,
  });
  @override
  Widget build(BuildContext context) {
    return ScaffoldExtendBodyUI(
      backgroundColor: AppColors.redTheme,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        excludeHeaderSemantics: true,
        elevation: 0,
        leading: IconButton(
          iconSize: 35,
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 35,
            color: Colors.amber,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: character.id,
            child: CachedNetworkImage(
              width: Dimensions.widthOf(context, 100),
              imageUrl: character.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: AppColors.whiteTheme,
            ),
            title: Text(
              character.name,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.whiteTheme,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              character.description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
