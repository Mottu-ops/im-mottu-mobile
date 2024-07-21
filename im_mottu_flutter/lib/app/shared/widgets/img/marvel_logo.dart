import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarvelLogo extends StatelessWidget {
  const MarvelLogo({super.key, this.colorFilter, this.width, this.height});
  final Color? colorFilter;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    const String assetLogo = 'assets/svg/Marvel_Studios_2016_logo.svg';
    return SvgPicture.asset(
      assetLogo,
      width: width,
      height: height,
      semanticsLabel: 'Marvel Logo',
      colorFilter: null,
    );
  }
}
