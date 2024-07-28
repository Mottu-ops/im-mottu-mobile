import 'package:im_mottu_mobile/core/components/loading/loading.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
class AppButtons {
  static Widget buttonWithDisable({
    required context,
    required String title,
    required Function() onTap,
    required bool enable,
    required bool isLoading,
    bool? needShadow = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.sizeOf(context).width / 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            boxShadow: needShadow!
                ? const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: AppThemes.dark,
                      blurRadius: 10,
                    )
                  ]
                : null,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: enable
                    ? [
                        AppThemes.primaryRegular,
                        AppThemes.primaryRegular,
                      ]
                    : [AppThemes.greyRegular, AppThemes.greyRegular])),
        child: Center(
            child: isLoading
                ? AppLoading.loading()
                : AppText.subTitle(
                    text: title,
                    color: !enable ? AppThemes.dark : AppThemes.white,
                  )),
      ),
    );
  }

  static Widget buttonSize({
    required context,
    required String title,
    required Function() onTap,
    Color? color = AppThemes.primaryRegular,
    Gradient? gradie,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color:  color,
            gradient: gradie == null ? null :
                const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppThemes.primaryRegular,
                      AppThemes.primaryRegular,
                    ])),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText.title(
            text: title,
            color: AppThemes.white,
          ),
        )),
      ),
    );
  }
}
