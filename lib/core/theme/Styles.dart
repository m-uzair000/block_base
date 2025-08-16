import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

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
      fontFamily: "Poppins",

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          fontFamily: "Lato",
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        displayMedium: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Lato",
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Lato",
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        titleLarge: TextStyle( // AppBar title style
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: "Roboto",
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: "Roboto",
          color: isDarkTheme ? Colors.white70 : Colors.black87,
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          fontFamily: "Poppins",
          color: isDarkTheme ? Colors.white70 : Colors.black87,
          height: 1.5,
        ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          color: Colors.grey,
        ),
      ),

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(kPrimaryColor.value, color),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.grey[900] : kAppbarBackgroundColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : kPrimaryColor,
        ),
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
          fontFamily: "Poppins",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
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
              (states) => states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
        trackColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => states.contains(WidgetState.selected) ? kPrimaryColor : null,
        ),
      ),

      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(kPrimaryColor),
        trackColor: WidgetStateProperty.all(
            isDarkTheme ? Colors.white24 : kAppbarPrimaryColor),
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(10),
      ),

      useMaterial3: true,

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
