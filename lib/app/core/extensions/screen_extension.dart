import 'dart:io';

import '../screen/screen_util.dart';

extension ScreenExtension on num {
  double get scale {
    if (Platform.isWindows) return toDouble();

    return this / ScreenUtil.designBlock * ScreenUtil.block;
  }

  double get percent => clamp(0, 100) * ScreenUtil.block;
}
