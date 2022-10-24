import 'package:flutter/painting.dart';

extension ColorsExtension on Color {
  /// Valor do `percent` entre 0 e 1
  Color darken([double percent = .1]) {
    assert(percent >= 0 && percent <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark =
        hsl.withLightness((hsl.lightness - percent).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// Valor do `percent` entre 0 e 1
  Color brighten([double percent = .1]) {
    final Color color = this;
    assert(0 <= percent && percent <= 1);
    return Color.fromARGB(
        color.alpha,
        color.red + ((255 - color.red) * percent).round(),
        color.green + ((255 - color.green) * percent).round(),
        color.blue + ((255 - color.blue) * percent).round());
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  /// String no formato "aabbcc" ou "ffaabbcc" com opcional "#".
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
