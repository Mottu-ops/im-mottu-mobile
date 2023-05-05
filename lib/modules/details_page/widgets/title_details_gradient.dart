import 'package:flutter/material.dart';
import 'package:mottu_test/core/themes/app_colors.dart';

class TitleDetailsGradient extends StatelessWidget {
  const TitleDetailsGradient({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [AppColors.defaultBlack, Colors.transparent])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          maxLines: 2,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
