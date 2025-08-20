import 'package:block_base/core/services/screen_config/screen_config.dart';
import 'package:flutter/material.dart';

class ScreenConfigInit extends StatelessWidget {
  final Widget child;
  final Size designSize;

  /// If false, forces the app to always use mobile design size for tablet/desktop
  final bool allowResponsive;

  const ScreenConfigInit({
    super.key,
    required this.child,
    this.designSize = const Size(393, 852),
    this.allowResponsive = true,
  });

  static bool _isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Detect if current device is mobile
        final bool isMobile = _isMobile(context);

        // Decide which size to use
        final Size initSize = (!allowResponsive && !isMobile)
            ? designSize
            : Size(constraints.maxWidth, constraints.maxHeight);

        ScreenConfig.init(context, designSize: initSize);

        // If not responsive and device is tablet/desktop, center child
        if (!allowResponsive && !isMobile) {
          return Center(
            child: SizedBox(
              width: designSize.width,
              height: designSize.height,
              child: child,
            ),
          );
        }

        // Normal rendering for mobile or responsive allowed
        return child;
      },
    );
  }
}
