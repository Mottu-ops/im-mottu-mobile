import 'package:flutter/material.dart';
import 'package:mottu_design_system/src/themes/mottu_color_theme.dart';

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
    final colors = Theme.of(context).extension<MottuColorsTheme>()!;

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color ?? colors.backgroundSecondary),
      ),
    );
  }
}
