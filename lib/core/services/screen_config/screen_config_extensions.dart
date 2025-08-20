import 'package:flutter/material.dart';
import 'screen_config.dart';

extension NumScreenExtension on num {
  double get w => this * ScreenConfig.scaleWidth;
  double get h => this * ScreenConfig.scaleHeight;
  double get r => this * ScreenConfig.scaleWidth;

  /// font sizes
  double get sp => this * ScreenConfig.scaleText;                 /// balanced scaling
  double get spRaw => this * ScreenConfig.scaleWidth;             /// only width scaling
  double get spSystem => sp / ScreenConfig.textScaleFactor;       /// respect system scaling

  /// percentage of screen
  double get sw => ScreenConfig.screenWidth * this;
  double get sh => ScreenConfig.screenHeight * this;
}

extension BuildContextScreenExtension on BuildContext {
  double get screenWidth => ScreenConfig.screenWidth;
  double get screenHeight => ScreenConfig.screenHeight;
  double get statusBarHeight => ScreenConfig.statusBarHeight;
  double get bottomBarHeight => ScreenConfig.bottomBarHeight;
  double get pixelRatio => ScreenConfig.pixelRatio;

  bool get isPortrait => screenHeight > screenWidth;
  bool get isLandscape => screenWidth > screenHeight;
}

extension EdgeInsetsScreenExtension on EdgeInsets {
  EdgeInsets get r => copyWith(
    left: left.r,
    right: right.r,
    top: top.r,
    bottom: bottom.r,
  );
}

extension BorderRadiusScreenExtension on BorderRadius {
  BorderRadius get r => BorderRadius.only(
    topLeft: Radius.circular(topLeft.x.r),
    topRight: Radius.circular(topRight.x.r),
    bottomLeft: Radius.circular(bottomLeft.x.r),
    bottomRight: Radius.circular(bottomRight.x.r),
  );
}
