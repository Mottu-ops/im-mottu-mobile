import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppText {
  static Widget title(
      {required String text,
      TextAlign? textAlign,
      Color? color,
      double? fontSize = 16,
      FontWeight? fontWeight = FontWeight.w700,
      TextDecoration? decoration,
      TextOverflow? textOverflow,
      int? maxLine,
      String? fontFamily,
      double? letterSpacing,
      double? height}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: true,
      style: TextStyle(
        height: height,
        color: color ?? AppThemes.title,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
           fontFamily: fontFamily ?? AppThemes.font1,
        overflow: textOverflow,
      ),
    );
  }

  static Widget subTitle(
      {required String text,
      TextAlign? textAlign,
      Color? color,
      double? fontSize = 14,
      FontWeight? fontWeight = FontWeight.w600,
      TextDecoration? decoration,
      TextOverflow? textOverflow,
      int? maxLine,
      String? fontFamily,
      double? height}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: true,
      style: TextStyle(
        color: color ?? AppThemes.textPrimary,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height,
        fontFamily: fontFamily ?? AppThemes.font1,
        overflow: textOverflow,
      ),
    );
  }

  static Widget description({
    required String text,
    TextAlign? textAlign,
    Color? color,
    double? fontSize = 15,
    double? height = 1.4,
    int? maxLine,
    bool? softWrap,
      String? fontFamily,
    FontWeight? fontWeight = FontWeight.w400,
    TextOverflow? textOverflow,
    TextDecoration? decoration,
  }) {
    return Text(
      text.tr,
      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: softWrap,
      style: TextStyle(
        color: color ?? AppThemes.textSecundary,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height,

      ),
      overflow: textOverflow,
    );
  }

  static Widget textButtonUnderline({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    double? fontSize = 12,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: title(
        text: text,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        decoration: TextDecoration.underline,
        // color: color ?? SyxThemes.secundaryText,
      ),
    );
  }

  static Widget parternRinch({
    required List<InlineSpan> textSpan,
    String? textPrimary,
    double? fontSize = 12.0,
    FontWeight? fontWeight = FontWeight.w400,
    double? heigth = 1.8,
    Color? color,
    String? fontFamily,
    TextAlign? textAlign = TextAlign.start,
    bool? overflow = false,
  }) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
          spellOut: false,
          style: TextStyle(
              color: color ?? AppThemes.textPrimary,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: overflow == true ? TextOverflow.ellipsis : null,
              decoration: TextDecoration.none),
          text: textPrimary,
          children: textSpan),
    );
  }

  ///COMPONENTE RINCH TEXT COM O SEGUNDO TEXT EM NEGRITO
  static Widget richTextWithBold({
    required String textA,
    required String textB,
    bool lineBreak = false,
    bool overflow = false,
    bool lineThrough = false,
    Color color = AppThemes.dark,
    Color colorTextB = AppThemes.dark,
    Color colorlineThrough = AppThemes.dark,
    double fontSizeTextA = 14.0,
    double fontSizeTextB = 14.0,
    double lineHeight = 1.8,
    FontWeight fontWeightA = FontWeight.w700,
    FontWeight fontWeightB = FontWeight.w500,
    String? fontFamily,
    TextAlign? textAlign,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: color,
          fontSize: fontSizeTextA,
          overflow: overflow ? TextOverflow.ellipsis : null,
          decoration: TextDecoration.none,
        ),
        children: [
          TextSpan(
            text: textA,
            style: TextStyle(
              fontWeight: fontWeightA,
              height: lineHeight,
              decoration: lineThrough ? TextDecoration.lineThrough : null,
              decorationThickness: 2,
              decorationColor: colorlineThrough,
            ),
          ),
          TextSpan(
            text: lineBreak ? '\n$textB' : textB,
            style: TextStyle(
              fontWeight: fontWeightB,
              fontSize: fontSizeTextB,
              height: lineHeight,
              color: colorTextB,
              decoration: lineThrough ? TextDecoration.lineThrough : null,
              decorationThickness: 2,
              decorationColor: colorlineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
