import 'package:block_base/core/services/screen_config/screen_config.dart';
import 'package:flutter/material.dart';

class ScreenConfigInit extends StatelessWidget {
  final Widget child;
  final Size designSize;

  const ScreenConfigInit({
    super.key,
    required this.child,
    this.designSize = const Size(375, 812),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenConfig.init(context, designSize: designSize);
        return child;
      },
    );
  }
}
