import 'package:flutter/material.dart';

import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/themes/app_colors.dart';

class DescriptionDetail extends StatelessWidget {
  final Size size;
  final Results movie;
  const DescriptionDetail({
    required this.movie,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.defaultBlack.withOpacity(0.4),
              border: Border.all(
                width: 2,
                color: AppColors.defaultWhite,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: movie.description.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 10),
                    child: Text(
                      movie.description.isEmpty
                          ? 'There is no description yet'
                          : movie.description.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: Text(
                        movie.description.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
