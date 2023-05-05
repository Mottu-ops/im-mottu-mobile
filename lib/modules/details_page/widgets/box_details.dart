import 'package:flutter/material.dart';
import 'package:mottu_test/modules/details_page/widgets/box_text.dart';
import 'package:mottu_test/modules/details_page/widgets/description.dart';

import '../../../core/models/marvel_model.dart';

class BoxDetails extends StatelessWidget {
  const BoxDetails({
    super.key,
    required this.movie,
    required this.size,
  });

  final Results movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BoxText(
              title: "Available",
              subtile: movie.comics.available.toString(),
            ),
            BoxText(
              title: "Events",
              subtile: movie.events.available.toString(),
            ),
            BoxText(
              title: "Stories",
              subtile: movie.stories.available.toString(),
            ),
          ],
        ),
      ),
      DescriptionDetail(movie: movie, size: size)
    ]));
  }
}
