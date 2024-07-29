import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSearchInputField extends StatelessWidget {
  const AppSearchInputField(
      {super.key,
      required this.controller,
      required this.iconPrefix,
      required this.labelText,
      this.hintText,
      required this.validator,
      this.clearIconSuffix = true,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.focusNode,
      this.obscureText = false,
      this.enabled = true,
      this.readOnly = false,
      this.minLines = 1,
      this.maxLines,
      this.inputFormatters,
      required this.onChanged,
      required this.onSaved,
      this.onEditingComplete,
      this.hasNewIcon = false,
      this.onFieldSubmitted,
      this.styleMain,
      this.sizeIcon = 21,
      this.paddingIcon = 0,
      this.inputBorder,
      this.newIcon = Icons.abc,
      this.iconFunction,
      this.enabledBorder,
      this.focusedBorder,
      this.maxLength,
      this.autofocus = false});

  final TextEditingController controller;
  final IconData? iconPrefix;
  final TextStyle? styleMain;
  final bool clearIconSuffix;
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final InputBorder? inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool autofocus;
  final bool hasNewIcon;
  final double? sizeIcon;
  final double? paddingIcon;
  final IconData? newIcon;
  final int? maxLength;
  final Function()? iconFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppThemes.primaryRegular,
      style: styleMain ??  TextStyle(color: AppThemes.textPrimary),
      maxLength: maxLength,
      
      decoration: InputDecoration(
              isCollapsed: false,
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(
                  color: AppThemes.greyRegular,
                ),
              ),
              hintText: labelText,
              hintStyle:
                  TextStyle(color: AppThemes.textPrimary.withOpacity(0.5)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(
                  color: AppThemes.errorRegular,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(
                  color: AppThemes.greyRegular,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(
                  color: AppThemes.greyRegular,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(
                  color: AppThemes.primaryRegular,
                ),
              ),
              focusColor: AppThemes.primaryRegular,
              iconColor: AppThemes.primaryRegular,
              label: AppText.subTitle(
                  text: labelText, fontWeight: FontWeight.w600),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: Center(
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppThemes.primaryRegular.withOpacity(0.2)),
                      child: Padding(
                        padding: EdgeInsets.only(top: paddingIcon!),
                        child: Icon(
                          iconPrefix,
                          size: 15,
                          color: AppThemes.primaryRegular,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              suffixIcon: hasNewIcon
                  ? IconButton(
                      icon: Icon(newIcon, size: 21),
                      onPressed: iconFunction,
                    )
                  : null,
            ),
      autofocus: autofocus,
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      minLines: minLines,
      validator: validator,
      enabled: enabled,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
    );
  }
}
