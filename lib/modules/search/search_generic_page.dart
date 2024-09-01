import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/modules/ui/search_text_field_ui.dart';

class SearchGenericPage extends StatelessWidget {
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final Widget? leading;
  final Widget child;

  const SearchGenericPage({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.leading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        titleSpacing: 8,
        leading: leading,
        title: SearchTextFieldUI(
          controller: textEditingController,
          onChanged: onChanged,
          autoFocus: true,
          hintText: "do_search_here".tr,
        ),
      ),
      body: child,
    );
  }
}
