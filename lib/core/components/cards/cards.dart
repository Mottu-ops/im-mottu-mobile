import 'package:flutter/widgets.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';

class AppCards {
  static comics({required String title, required String thumbnail}) {
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
}
