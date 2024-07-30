import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/context/character/model/charater_model.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:im_mottu_mobile/routes/app_pages.dart';

class AppCards {
  static Widget comics({required String title, required String thumbnail}) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 120,
              child: AppText.description(
                  text: title,
                  maxLine: 2,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  textAlign: TextAlign.start),
            ),
          ],
        ),
      ),
    );
  }

  static Widget character({
    required CharacterModel model,
    double? rounded = 9,
    double? height = 90,
    double? width = 90,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.characterDetailPage, arguments: model.id);
      },
      child: SizedBox(
        child: Column(
          children: [
            Hero(
              tag: "${model.name.toLowerCase()}${model.id}",
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(rounded!),
                    border:
                        Border.all(color: AppThemes.primaryRegular, width: 2),
                    image: DecorationImage(
                        image: NetworkImage(model.thumbnail),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 90,
              child: AppText.description(
                text: model.name,
                textAlign: TextAlign.center,
                maxLine: 2,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
