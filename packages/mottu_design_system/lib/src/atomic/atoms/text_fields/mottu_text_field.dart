import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';

class MottuTextField extends StatelessWidget {
  const MottuTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: MottuColors.white,
        ),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: MottuColors.blackMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: MottuColors.white),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
