import 'package:flutter/widgets.dart';
import 'package:mottu_design_system/src/atomic/atoms/text/mottu_base_text.dart';
import 'package:mottu_design_system/src/themes/mottu_text_style_theme.dart';

class MottuHeading1Text extends MottuBaseText {
  const MottuHeading1Text.regular(
    super.text, {
    super.key,
    super.forceBrightness,
    super.overflow,
    super.maxLines,
    super.textAlign,
    super.color,
  }) : super(injectMottuTextStyleTheme: _textStyleRegular);

  static TextStyle _textStyleRegular(MottuTextStyleTheme styles) => styles.heading1.regular;
}

class MottuHeading2Text extends MottuBaseText {
  const MottuHeading2Text.regular(
    super.text, {
    super.key,
    super.forceBrightness,
    super.overflow,
    super.maxLines,
    super.textAlign,
    super.color,
  }) : super(injectMottuTextStyleTheme: _textStyleRegular);

  static TextStyle _textStyleRegular(MottuTextStyleTheme styles) => styles.heading2.regular;
}

class MottuBody1Text extends MottuBaseText {
  const MottuBody1Text.regular(
    super.text, {
    super.key,
    super.forceBrightness,
    super.overflow,
    super.maxLines,
    super.textAlign,
    super.color,
  }) : super(injectMottuTextStyleTheme: _textStyleRegular);

  const MottuBody1Text.medium(
    super.text, {
    super.key,
    super.forceBrightness,
    super.overflow,
    super.maxLines,
    super.textAlign,
    super.color,
  }) : super(injectMottuTextStyleTheme: _textStyleMedium);

  const MottuBody1Text.bold(
    super.text, {
    super.key,
    super.forceBrightness,
    super.overflow,
    super.maxLines,
    super.textAlign,
    super.color,
  }) : super(injectMottuTextStyleTheme: _textStyleBold);

  static TextStyle _textStyleRegular(MottuTextStyleTheme styles) => styles.body1.regular;
  static TextStyle _textStyleMedium(MottuTextStyleTheme styles) => styles.body1.medium;
  static TextStyle _textStyleBold(MottuTextStyleTheme styles) => styles.body1.bold;
}
