import 'package:flutter/material.dart';

class MottuProgressIndicator extends StatelessWidget {
  const MottuProgressIndicator({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
