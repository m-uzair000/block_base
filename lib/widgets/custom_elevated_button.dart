import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double borderRadius;
  final Color? color;
  final Size? size;
  final bool isLoading;
  final bool isDisabled;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.borderRadius = 8.0,
    this.color = kPrimaryColor,
    this.size,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _disabled = isDisabled || isLoading;

    return Material(
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      elevation: 0,
      child: ElevatedButton(
        onPressed: _disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _disabled ? Colors.grey : color,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          minimumSize: size ?? Size(MediaQuery.of(context).size.width, 45),
        ),
        child: isLoading
            ? SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
            : child,
      ),
    );
  }
}
