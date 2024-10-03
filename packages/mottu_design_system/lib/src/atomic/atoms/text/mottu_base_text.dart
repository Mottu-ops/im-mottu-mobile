import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/atomic/atoms/text/mottu_text_style_theme.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';

typedef InjectMottuTextStyleTheme = TextStyle Function(MottuTextStyleTheme);

abstract class MottuBaseText extends StatelessWidget {
  const MottuBaseText(
    this.text, {
    super.key,
    this.forceBrightness,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.color,
    required this.injectMottuTextStyleTheme,
  });

  final String text;
  final Brightness? forceBrightness;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  final InjectMottuTextStyleTheme injectMottuTextStyleTheme;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).extension<MottuTextStyleTheme>()!;
    final colors = Theme.of(context).extension<MottuColorsTheme>()!;
    final textStyle = injectMottuTextStyleTheme(style).copyWith(color: color ?? colors.defaultText);

    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
