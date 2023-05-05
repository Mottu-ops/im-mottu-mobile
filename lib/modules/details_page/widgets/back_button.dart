import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';

class BackButtonCircle extends StatelessWidget {
  const BackButtonCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.defaultBlack.withOpacity(0.45),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }
}
