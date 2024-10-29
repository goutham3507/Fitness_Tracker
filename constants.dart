import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static const primaryColor = Color(0xFF6358E1);
  static const backgroundColor = Color(0xFFF2F3F5);
  static const cardColor = Color(0xFFFFFFFF);
  static const accentColor = Color(0xFF5C6BC0);
  static const textColor = Color(0xFF1F2022);
  static const grey = Color(0xFFB6BDC6);
}

final ThemeData appTheme = ThemeData(
  primaryColor: ColorConstants.primaryColor,
  scaffoldBackgroundColor: ColorConstants.backgroundColor,
  cardColor: ColorConstants.cardColor,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorConstants.textColor,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16,
      color: ColorConstants.textColor,
    ),
  ),
);
