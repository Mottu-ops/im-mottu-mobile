import 'dart:ui';

import 'package:flutter/foundation.dart';

class DesignUI {
  final Size size;
  final TargetPlatform platform;

  const DesignUI({
    required this.size,
    required this.platform,
  });

  DesignUI copyWith({
    Size? size,
    TargetPlatform? platform,
  }) {
    return DesignUI(
      size: size ?? this.size,
      platform: platform ?? this.platform,
    );
  }

  static const DesignUI androidMaterial = DesignUI(
    size: Size(360, 640),
    platform: TargetPlatform.android,
  );
  static const DesignUI pixel2XL = DesignUI(
    size: Size(411, 823),
    platform: TargetPlatform.android,
  );

  static const DesignUI pixel2 = DesignUI(
    size: Size(411, 731),
    platform: TargetPlatform.android,
  );
  static const DesignUI pixel5 = DesignUI(
    size: Size(393, 851),
    platform: TargetPlatform.android,
  );

  static const DesignUI pixel4XL = pixel4;
  static const DesignUI pixel4 = DesignUI(
    size: Size(412, 870),
    platform: TargetPlatform.android,
  );

  static const DesignUI iPhone12ProMax = DesignUI(
    size: Size(428, 926),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPhone12 = iPhone12Pro;
  static const DesignUI iPhone12Pro = DesignUI(
    size: Size(390, 844),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPhone11Pro = iPhoneX;
  static const DesignUI iPhoneXS = iPhoneX;
  static const DesignUI iPhoneX = DesignUI(
    size: Size(375, 812),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPhone11ProMax = iPhoneXR;
  static const DesignUI iPhone11 = iPhoneXR;
  static const DesignUI iPhoneXSMax = iPhoneXR;
  static const DesignUI iPhoneXR = DesignUI(
    size: Size(414, 896),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPhone8Plus = iPhone6;
  static const DesignUI iPhone7 = iPhone6;
  static const DesignUI iPhone8ProMax = DesignUI(
    size: Size(414, 736),
    platform: TargetPlatform.iOS,
  );
  static const DesignUI iPhone6 = DesignUI(
    size: Size(414, 736),
    platform: TargetPlatform.iOS,
  );
  static const DesignUI iPhoneSE = DesignUI(
    size: Size(320, 568),
    platform: TargetPlatform.iOS,
  );

  // --------> TABLETS
  static DesignUI nexus9 = iPad.copyWith(
    platform: TargetPlatform.android,
  );
  static const DesignUI iPadMini = iPad;
  static const DesignUI iPad = DesignUI(
    size: Size(768, 1024),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPadPro10dot5 = DesignUI(
    size: Size(834, 1112),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPadPro11 = DesignUI(
    size: Size(834, 1194),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI iPadPro12dot9 = DesignUI(
    size: Size(1024, 1366),
    platform: TargetPlatform.iOS,
  );

  static const DesignUI samgungGalaxyTab10 = DesignUI(
    size: Size(800, 1280),
    platform: TargetPlatform.android,
  );
}
