import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marvel/services/constants/app_images.dart';
import 'package:marvel/services/dimensions.dart';

class LoadingScreenUI extends StatelessWidget {
  const LoadingScreenUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: PopScope(
        canPop: false,
        child: SizedBox(
          width: Dimensions.widthOf(context, 100),
          height: Dimensions.heightOf(context, 100),
          child: Image.asset(
            AppImages.loading,
            fit: BoxFit.cover,
            width: Dimensions.widthOf(context, 100),
            height: Dimensions.heightOf(context, 100),
          ),
        ),
      ),
    );
  }
}
