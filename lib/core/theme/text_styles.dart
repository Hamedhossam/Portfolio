import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Headings: Poppins or Space Grotesk — bold, large, -1.5 letter spacing
  static TextStyle h1 = GoogleFonts.spaceGrotesk(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.5,
    color: AppColors.textPrimary,
  );

  static TextStyle h2 = GoogleFonts.spaceGrotesk(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.2,
    color: AppColors.textPrimary,
  );

  static TextStyle h3 = GoogleFonts.spaceGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: AppColors.textPrimary,
  );

  static TextStyle h4 = GoogleFonts.spaceGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.textPrimary,
  );

  // Body: Inter — weight 400-500, comfortable line-height 1.6
  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );
  
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}
