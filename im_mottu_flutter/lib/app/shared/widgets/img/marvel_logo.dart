import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarvelLogo extends StatelessWidget {
  const MarvelLogo({super.key, this.colorFilter, this.width, this.height});
  final Color? colorFilter;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    const String assetLogo = 'assets/svg/Marvel_Logo.svg';
    return SvgPicture.asset(
      assetLogo,
      width: width,
      height: height,
      semanticsLabel: 'Marvel Logo',
      colorFilter: ColorFilter.mode(
        colorFilter ?? colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}
