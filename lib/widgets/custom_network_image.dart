import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Widget? errorWidget;
  final Widget? placeholder;

  const CustomNetworkImage(
      this.imageUrl, {
        Key? key,
        this.fit = BoxFit.cover,
        this.width,
        this.height,
        this.color,
        this.colorBlendMode,
        this.errorWidget,
        this.placeholder,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>
      placeholder ?? const Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) =>
      errorWidget ??
          const Icon(
            Icons.error,
            color: Colors.redAccent,
          ),
      fit: fit,
      height: height,
      width: width,
      color: color,
      colorBlendMode: colorBlendMode,
    );
  }
}
