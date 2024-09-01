import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/ui/circular_progress_indicator_ui.dart';
import 'package:marvel/modules/ui/scroll_bar_ui.dart';
import 'package:marvel/services/dimensions.dart';

class CharacterList extends StatelessWidget {
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  final List<Character> characters;
  final void Function(Character) onCharacterTap;

  const CharacterList({
    super.key,
    required this.scrollController,
    required this.onRefresh,
    this.characters = const [],
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollBarUI(
      controller: scrollController,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
          shrinkWrap: false,
          physics: const ClampingScrollPhysics(),
          controller: scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          itemCount: characters.length,
          itemBuilder: (context, index) {
            Character character = characters[index];
            bool shouldShowLoading = (index + 1) == characters.length;
            return Stack(
              children: [
                Positioned(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            onCharacterTap(character);
                          },
                          child: Hero(
                            tag: character.id,
                            child: CachedNetworkImage(
                              width: Dimensions.widthOf(context, 100),
                              imageUrl: character.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
    );
  }
}
