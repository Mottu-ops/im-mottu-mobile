import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

import '../extensions/orientation_extension.dart';
import '../extensions/screen_extension.dart';
import 'design_ui.dart';

const double _kTabletBreakpoint = 550;

class ScreenUtil {
  ScreenUtil._();

  static ScreenUtil get instance => _instanceAux ??= ScreenUtil._();

  static ScreenUtil? _instanceAux;

  late double _width;
  late double _height;
  late double _block;
  late double _blockVertical;

  late double _bottomBarHeight;
  late double _textScaleFactor;

  late Orientation _orientation;

  late DesignUI _designUI;
  late double _designBlock;

  static Widget builder({
    BuildContext? context,
    DesignUI designUI = DesignUI.iPhone12ProMax,
    DesignUI designUITablet = DesignUI.iPadPro12dot9,
    required Widget Function(
      BuildContext context,
      BoxConstraints constraints,
      Orientation orientation,
    )
        builder,
  }) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        ScreenUtil.init(designUI, designUITablet, constraints, orientation);
        return builder(context, constraints, orientation);
      });
    });
  }

  static void init(
    DesignUI designUI,
    DesignUI designUITablet,
    BoxConstraints constraints,
    Orientation orientation,
  ) {
    double width;
    double height;
    double block;
    double blockVertical;

    const double bottomBarHeight = kBottomNavigationBarHeight;
    final ScreenUtil instance = ScreenUtil._();

    width = constraints.maxWidth;
    height = constraints.maxHeight;

    final double shortestSide = min(width, height);
    if (shortestSide < _kTabletBreakpoint) {
      instance._designUI = designUI;
    } else {
      instance._designUI = designUITablet;
    }

    block = orientation.isPortrait ? width / 100 : height / 100;
    blockVertical = height / 100;

    width = constraints.maxWidth;
    height = constraints.maxHeight;

    instance._width = width;
    instance._orientation = orientation;
    instance._height = height;
    instance._block = block;
    instance._blockVertical = blockVertical;
    instance._bottomBarHeight = bottomBarHeight;
    instance._designBlock = instance._designUI.size.width / 100;

    _instanceAux = instance;
  }

  static Orientation get orientation => instance._orientation;

  static double get width => instance._width;
  static double get height => instance._height;
  static double get block => instance._block;
  static double get blockVertical => instance._blockVertical;

  static double get toolBarHeight => (kToolbarHeight * 2).scale;
  static double get toolBarHeightSmall => kToolbarHeight.scale;
  static double get bottomBarHeight => instance._bottomBarHeight;
  static double get textScaleFactor => instance._textScaleFactor;
  static bool get isTablet => min(width, height) > _kTabletBreakpoint;

  static double pageViewHeight(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        (kToolbarHeight * 2).scale -
        MediaQueryData.fromWindow(window).padding.top;
  }

  static double pageViewHeightLegacy(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        kToolbarHeight.scale -
        MediaQueryData.fromWindow(window).padding.top;
  }

  static double scaleDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio / 4.0;
  }

  static double get designBlock => instance._designBlock;
  static DesignUI get designUI => instance._designUI;
}
