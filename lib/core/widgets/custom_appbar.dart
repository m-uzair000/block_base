import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? backWidget;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final bool isLightBrightness;
  final bool systemOverLay;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.backWidget,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
    this.isLightBrightness = false,
    this.systemOverLay = false,
    this.bottom,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? Theme.of(context).primaryColor;

    // Decide foreground text/icon color for AppBar
    final Color foregroundColor =
    bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: bgColor, // SafeArea background
        statusBarIconBrightness: Brightness.light, // Android -> white icons
        statusBarBrightness: Brightness.dark, // iOS -> white text
      ),
      child: Container(
        color: bgColor,
        child: SafeArea(
          bottom: false,
          child: AppBar(
            elevation: 0.0,
            titleSpacing: 0,
            shadowColor: Colors.transparent,
            centerTitle: centerTitle,
            backgroundColor: bgColor,
            automaticallyImplyLeading: automaticallyImplyLeading,
            iconTheme: IconThemeData(color: foregroundColor),
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: foregroundColor),
            leading: Navigator.canPop(context) && showBackButton
                ? Builder(builder: (context) => backWidget ?? BackButton(color: foregroundColor))
                : null,
            title: title,
            actions: actions,
            bottom: bottom,
          ),
        ),
      ),
    );
  }
}
