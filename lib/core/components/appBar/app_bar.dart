import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';

class AppAppBar {


static appBarBack({
    double? elevation = 3,
    required void Function()? onTap,
    bool? needLogo = true,
    bool automaticallyImplyLeading = false,
    String? title = "",
    Widget? widget,
    Color? bgColor,
    bool? centerTitle = true
  }) {
    return AppBar(
      elevation: elevation,
      centerTitle: centerTitle,
      backgroundColor: bgColor ?? AppThemes.bgSecundary,
      title: needLogo!
          ? Padding(
              padding: const EdgeInsets.only(top: 4),
              child: AppText.title(text: title!, fontSize: 16),
            )
          : Container(),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: widget != null ? [widget] : [],
      leading: IconButton(
        icon:  Icon(
          FontAwesomeIcons.arrowLeft,
          size: 21,
          color: AppThemes.iconPrimary,
        ),
        onPressed: onTap,
      ),
    );
  }

}