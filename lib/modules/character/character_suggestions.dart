import 'package:flutter/widgets.dart';
import 'package:marvel/models/character.dart';
import 'package:marvel/modules/character/character_list.dart';
import 'package:marvel/modules/ui/list_suggestions_ui.dart';

class CharacterSuggestions extends ListSuggestionsUI<Character> {
  final void Function(Character) onCharacterTap;

  CharacterSuggestions({
    super.key,
    required super.textEditingController,
    required super.controller,
    super.focusNode,
    super.onSearch,
    super.hintText = '',
    super.onTap,
    super.enabled = true,
    required this.onCharacterTap,
  }) : super(
          child: CharacterList(
            scrollController: ScrollController(),
            onRefresh: controller.onRefresh,
            characters: controller.items,
            onCharacterTap: onCharacterTap,
          ),
        );
}
