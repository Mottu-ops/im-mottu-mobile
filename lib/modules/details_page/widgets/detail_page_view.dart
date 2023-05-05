import 'package:flutter/material.dart';
import 'package:mottu_test/core/models/marvel_model.dart';
import 'package:mottu_test/core/themes/app_colors.dart';
import 'package:mottu_test/modules/details_page/widgets/box_details.dart';
import 'package:mottu_test/modules/details_page/widgets/card_details_image.dart';
import 'package:mottu_test/modules/details_page/widgets/title_details_gradient.dart';

class DetailPageView extends StatelessWidget {
  final Results movie;
  const DetailPageView({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.defaultRed.withOpacity(0.8),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.487,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Hero(
                  tag: movie.id,
                  child: Material(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CardDetails(size: size, movie: movie),
                        TitleDetailsGradient(title: movie.name),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        BoxDetails(movie: movie, size: size)
      ]),
    );
  }
}
