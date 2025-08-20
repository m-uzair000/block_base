import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, desktop }

class ScreenConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static late double statusBarHeight;
  static late double bottomBarHeight;
  static late double textScaleFactor;

  static Size _designSize = const Size(393, 852);
  static late DeviceType deviceType;

  /// If false, all devices will use mobile design size for scaling
  static bool allowResponsive = true;

  static void init(
      BuildContext context, {
        Size designSize = const Size(393, 852),
        bool responsive = true,
      }) {
    allowResponsive = responsive;

    final mq = MediaQuery.of(context);

    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
    pixelRatio = mq.devicePixelRatio;
    statusBarHeight = mq.padding.top;
    bottomBarHeight = mq.padding.bottom;
    textScaleFactor = mq.textScaleFactor;

    // If responsiveness is off and device is tablet/desktop, use mobile size
    if (!allowResponsive && mq.size.width >= 600) {
      _designSize = const Size(393, 852); // mobile design
    } else {
      _designSize = designSize;
    }

    // Determine device type
    if (screenWidth >= 1000) {
      deviceType = DeviceType.desktop;
    } else if (screenWidth >= 600) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }

  static double get scaleWidth => screenWidth / _designSize.width;
  static double get scaleHeight => screenHeight / _designSize.height;
  static double get scaleText => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;

  static double w(double width) => width * scaleWidth;
  static double h(double height) => height * scaleHeight;
  static double sp(double fontSize) => fontSize * scaleText;
}
