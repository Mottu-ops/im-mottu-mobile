import 'package:flutter/material.dart';

class CircularProgressIndicatorUI extends StatelessWidget {
  final double? value;
  final double width;
  final double height;
  final Color? color;

  const CircularProgressIndicatorUI({
    super.key,
    this.value,
    this.width = 23,
    this.height = 23,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      widthFactor: 1,
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
