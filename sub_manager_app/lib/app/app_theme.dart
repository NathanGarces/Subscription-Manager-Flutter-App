import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Theme Colors
  static const backgroundColor = Color(0xFFFBFBFB);
  static const backgroundConstrastColor = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFFFFFFFF);
  static const secondaryColor = Color(0xFF5A5A5A);
  static const accentColor = Color(0xFF5507E0);
  static const shadowColor = Colors.black26;

  //Gradient
  static const gradientColorOne = Color(0xFF8E2DE2);
  static const gradientColorTwo = Color(0xFF4A00E0);
  static const LinearGradient gradient = LinearGradient(
      colors: [gradientColorOne, gradientColorTwo],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  //Theme TextStyles
  //Headings
  static TextStyle h1 = GoogleFonts.roboto(
      fontSize: 24, color: primaryColor, fontWeight: FontWeight.w300);
  static TextStyle h2 = GoogleFonts.roboto(
      fontSize: 18, color: primaryColor, fontWeight: FontWeight.w300);
  //Body Text
  static TextStyle p1 = GoogleFonts.roboto(
      fontSize: 14, color: secondaryColor, fontWeight: FontWeight.w300);
  static TextStyle p2 = GoogleFonts.roboto(
      fontSize: 12, color: accentColor, fontWeight: FontWeight.w300);
}
