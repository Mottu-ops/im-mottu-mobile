import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  MyHeaderDelegate({required this.backgroundImageUrl, required this.bottomWidget});

  final String backgroundImageUrl;
  final Widget bottomWidget;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: progress,
          child: ColoredBox(
            color: const Color(0xBE7A81FF),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: 1 - progress,
          child: Image.network(
            backgroundImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomWidget,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 304;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
