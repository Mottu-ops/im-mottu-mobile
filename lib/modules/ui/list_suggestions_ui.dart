import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/modules/search/search_generic_controller.dart';
import 'package:marvel/modules/search/search_generic_page.dart';
import 'package:marvel/modules/ui/search_text_field_ui.dart';

Future<dynamic>? handleShowSearchTextField({
  required TextEditingController textEditingController,
  required Widget child,
  Function(String)? onChanged,
  Function()? onBack,
  String hintText = "do_search_here",
}) {
  return Get.to(
    () => SearchGenericPage(
      textEditingController: textEditingController,
      onChanged: onChanged,
      child: child,
    ),
    fullscreenDialog: true,
    transition: Transition.downToUp,
  );
}

class ListSuggestionsUI<T> extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onSearch;
  final SearchGenericController<T> controller;
  final String hintText;
  final void Function(T)? onTap;
  final bool enabled;
  final Widget child;
  final Function()? onBack;
  final Widget? target;
  final String autoCompleteHintText;

  const ListSuggestionsUI({
    super.key,
    required this.textEditingController,
    required this.controller,
    this.focusNode,
    this.onSearch,
    this.hintText = 'search',
    this.onTap,
    this.enabled = true,
    required this.child,
    this.onBack,
    this.target,
    this.autoCompleteHintText = 'do_search_here',
  });

  Future<void> onTapWidget() async {
    await handleShowSearchTextField(
      onBack: onBack,
      textEditingController: controller.textEditingController,
      onChanged: (String text) {
        controller.doSearch(text);
        if (onSearch != null) {
          onSearch!(text);
        }
      },
      hintText: autoCompleteHintText,
      child: child,
    );
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    if (target != null) {
      return GestureDetector(
        onTap: onTapWidget,
        child: target,
      );
    }
    return SearchTextFieldUI(
      controller: TextEditingController(),
      focusNode: focusNode,
      autoFocus: false,
      hintText: hintText,
      enabled: enabled,
      onTap: onTapWidget,
    );
  }
}
