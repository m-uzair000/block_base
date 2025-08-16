import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import 'app_text_styles.dart';

class Styles {
  static ThemeData themeData(BuildContext context, {bool isDarkTheme = false}) {
    Map<int, Color> color = {
      50: kPrimaryColor,
      100: kPrimaryColor,
      200: kPrimaryColor,
      300: kPrimaryColor,
      400: kPrimaryColor,
      500: kPrimaryColor,
      600: kPrimaryColor,
      700: kPrimaryColor,
      800: kPrimaryColor,
      900: kPrimaryColor,
    };

    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : kBackgroundColor,
      hintColor: Colors.grey.withOpacity(0.6),
      indicatorColor: kPrimaryColor,
      useMaterial3: true,

      // ✅ Link TextTheme with AppTextStyles
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1.copyWith(
          color: isDarkTheme ? Colors.white : AppTextStyles.h1.color,
        ),
        displayMedium: AppTextStyles.h2.copyWith(
          color: isDarkTheme ? Colors.white : AppTextStyles.h2.color,
        ),
        headlineLarge: AppTextStyles.h3.copyWith(
          color: isDarkTheme ? Colors.white : AppTextStyles.h3.color,
        ),
        titleLarge: AppTextStyles.h3.copyWith(
          fontWeight: FontWeight.w600,
          color: isDarkTheme ? Colors.white : kAppbarPrimaryColor,
        ),
        bodyLarge: AppTextStyles.body1.copyWith(
          color: isDarkTheme ? Colors.white70 : AppTextStyles.body1.color,
        ),
        bodyMedium: AppTextStyles.body2.copyWith(
          color: isDarkTheme ? Colors.white70 : AppTextStyles.body2.color,
        ),
        labelLarge: AppTextStyles.button,
        bodySmall: AppTextStyles.body2.copyWith(
          height: 1.5,
          color: isDarkTheme ? Colors.white70 : AppTextStyles.body2.color,
        ),
        labelSmall: AppTextStyles.caption,
      ),

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(kPrimaryColor.value, color),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ).copyWith(
        secondary: kSecondaryColor, // ✅ Fresh green accent
      ),

      // ✅ AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.grey[900] : kAppbarBackgroundColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : kPrimaryColor,
        ),
        titleTextStyle: AppTextStyles.h3.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: isDarkTheme ? Colors.white : kAppbarPrimaryColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
          isDarkTheme ? Brightness.light : Brightness.dark,
          statusBarBrightness:
          isDarkTheme ? Brightness.dark : Brightness.light,
        ),
      ),

      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : kPrimaryColor,
      ),
      primaryIconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : kAppbarPrimaryColor,
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
        ),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>(
              (states) =>
          states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => states.contains(WidgetState.selected)
              ? kPrimaryColor.withOpacity(0.4)
              : null,
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) =>
          states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) =>
          states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
      ),

      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(kPrimaryColor),
        trackColor: WidgetStateProperty.all(
            isDarkTheme ? Colors.white24 : kAppbarPrimaryColor.withOpacity(0.2)),
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(10),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width, 40),
        ),
      ),
    );
  }
}
