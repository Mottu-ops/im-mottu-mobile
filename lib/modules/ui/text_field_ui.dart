import 'package:flutter/material.dart';
import 'package:marvel/services/constants/app_colors.dart';

class TextFieldUI extends StatelessWidget {
  final void Function(String text)? onChanged;
  final String? hintText;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool enabled;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final bool autoFocus;

  const TextFieldUI({
    super.key,
    this.onChanged,
    this.hintText,
    this.borderRadius = 25.0,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.enabled = true,
    this.focusNode,
    this.onEditingComplete,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller ?? TextEditingController(),
      onChanged: onChanged,
      autofocus: autoFocus,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        enabled: enabled,
        hintStyle: const TextStyle(
          color: AppColors.hintColor,
          fontSize: 14,
        ),
        fillColor: AppColors.fillColor,
        contentPadding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onEditingComplete: onEditingComplete,
    );
  }
}
