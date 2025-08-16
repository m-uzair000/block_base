import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double borderRadius;
  final Color borderColor;
  final Size? size;
  final Color backgroundColor;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 8.0,
    this.borderColor = kPrimaryColor,
    this.size,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(borderColor),
        side: MaterialStateProperty.all(BorderSide(color: borderColor, width: 2)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          size ?? Size(MediaQuery.of(context).size.width, 45),
        ),
      ),
      child: child,
    );
  }
}
