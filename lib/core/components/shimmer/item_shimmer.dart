import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/core/themes/app_themes.dart';
import 'package:shimmer/shimmer.dart';

class AppItemShimmer {
  static Widget container({required double width, required double height}) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: AppThemes.greyDarker,
      highlightColor: AppThemes.greyRegular,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget icons({required double size, required IconData icon}) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: AppThemes.greyDarker,
      highlightColor: AppThemes.greyRegular,
      child: SizedBox(
        child: Icon(icon, size: size),
      ),
    );
  }

  static Widget comic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppItemShimmer.container(
          height: 140,
          width: 120,
        ),
        const SizedBox(
          height: 3,
        ),
        AppItemShimmer.container(
          height: 10,
          width: 80,
        ),
        const SizedBox(
          height: 3,
        ),
        AppItemShimmer.container(
          height: 10,
          width: 40,
        ),
      ],
    );
  }
  static Widget character({
     double? height = 120,
     double? width = 120,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppItemShimmer.container(
          height: height!,
          width: width!,
        ),
        const SizedBox(
          height: 3,
        ),
        AppItemShimmer.container(
          height: 10,
          width: 80,
        ),
    
      
      ],
    );
  }
}
