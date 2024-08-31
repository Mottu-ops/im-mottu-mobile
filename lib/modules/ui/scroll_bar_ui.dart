import 'package:flutter/material.dart';

class ScrollBarUI extends StatelessWidget {
  final ScrollController controller;
  final Color? thumbColor;
  final Radius? radius;
  final Widget child;
  final bool thumbVisibility;
  final Axis scrollDirection;
  final double? thickness;

  const ScrollBarUI({
    super.key,
    required this.controller,
    this.thumbColor,
    this.radius,
    required this.child,
    this.thumbVisibility = true,
    this.scrollDirection = Axis.vertical,
    this.thickness,
  });

  double get thicknessValue {
    if (thickness != null) {
      return thickness!;
    }
    if (scrollDirection == Axis.horizontal) {
      return 2.0;
    }
    return 3.0;
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thumbColor: Colors.white,
      radius: radius ?? const Radius.circular(20),
      thumbVisibility: thumbVisibility,
      interactive: true,
      thickness: thicknessValue,
      child: child,
    );
  }
}
