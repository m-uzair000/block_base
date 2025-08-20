import 'package:flutter/widgets.dart';

class ScreenConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static late double statusBarHeight;
  static late double bottomBarHeight;
  static late double textScaleFactor;

  static double baseWidth = 375;  /// default design width
  static double baseHeight = 812; /// default design height

  static void init(BuildContext context, {Size designSize = const Size(375, 812)}) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    pixelRatio = mq.devicePixelRatio;
    statusBarHeight = mq.padding.top;
    bottomBarHeight = mq.padding.bottom;
    textScaleFactor = mq.textScaleFactor;

    baseWidth = designSize.width;
    baseHeight = designSize.height;
  }

  static double get scaleWidth => screenWidth / baseWidth;
  static double get scaleHeight => screenHeight / baseHeight;

  /// Balanced scaling for fonts (min of width/height scale)
  static double get scaleText => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
}
