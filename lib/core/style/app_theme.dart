import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  //Light Theme
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
      ),
    ),
    fontFamily: GoogleFonts.notoSans().fontFamily,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: AppColors.transparent,
      backgroundColor: AppColors.light,
      foregroundColor: AppColors.color1F2937,
      surfaceTintColor: AppColors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.color1F2937,
      ),
    ),
  );

  //Dark Theme
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
      ),
    ),
    fontFamily: GoogleFonts.notoSans().fontFamily,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: AppColors.transparent,
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.light,
      surfaceTintColor: AppColors.transparent,

      iconTheme: IconThemeData(
        color: AppColors.light,
      ),
    ),
  );
}
