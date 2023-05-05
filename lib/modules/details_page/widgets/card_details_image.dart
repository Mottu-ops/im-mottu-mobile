import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mottu_test/core/models/marvel_model.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            '${movie.thumbnail.path}.${movie.thumbnail.extension}',
          ),
        ),
      ),
    );
  }
}
