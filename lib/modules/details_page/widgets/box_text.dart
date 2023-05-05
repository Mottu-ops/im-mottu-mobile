import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';

class BoxText extends StatelessWidget {
  const BoxText({
    super.key,
    required this.title,
    required this.subtile,
  });

  final String title;
  final String subtile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 130,
      decoration: BoxDecoration(
        color: AppColors.defaultBlack.withOpacity(0.4),
        border: Border.all(
          width: 2,
          color: AppColors.defaultWhite,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtile,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
