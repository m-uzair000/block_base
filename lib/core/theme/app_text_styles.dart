import 'package:block_base/core/services/screen_config/screen_config_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Headline styles
  static final TextStyle h1 = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static final TextStyle h2 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static final TextStyle h3 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  // Body styles
  static final TextStyle body1 = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static final TextStyle body2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );

  // Button text
  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Caption/small text
  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Price text
  static final TextStyle price = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: Colors.green,
  );

  // Offer / Discount text
  static final TextStyle discount = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
}
