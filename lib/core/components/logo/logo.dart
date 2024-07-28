import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';

class AppLogo {
 static Widget logo() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: AppThemes.bgMarvel),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AppText.title(
                text: 'MARVEL',
                fontSize: 52,
                letterSpacing: -3,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              bottom: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: AppText.subTitle(
                text: 'Mottu',
                fontSize: 52,
                height: 1.2,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
