import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final Color color;
  final EdgeInsets padding;
  final double opacity;
  final BoxBorder? border;

  const GlassContainer({
    required this.child,
    this.width = double.infinity,
    this.height = 200,
    this.borderRadius = 20,
    this.blur = 10,
    this.color = Colors.white,
    this.opacity = 0.2,
    this.border,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
