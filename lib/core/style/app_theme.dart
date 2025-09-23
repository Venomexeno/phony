import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extensions/color_opacity_extension.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  //Light Theme
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
        elevation: 0,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.color1F2937,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.colore5e7eb,
      filled: true,
      contentPadding: EdgeInsets.zero,
      isDense: true,
      suffixIconColor: AppColors.grey400,
      prefixIconColor: AppColors.grey400,
      hintStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.grey400,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.secondary,
      selectionColor: AppColors.secondary.toOpacity(0.2),
      selectionHandleColor: AppColors.secondary,
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
    iconTheme: IconThemeData(
      color: AppColors.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.light,
        elevation: 0,
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
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.color283039,
      filled: true,

      contentPadding: EdgeInsets.zero,
      isDense: true,
      suffixIconColor: AppColors.grey400,
      hintStyle: AppTextStyles.regular14.copyWith(
        color: AppColors.grey400,
      ),
      prefixIconColor: AppColors.grey400,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.transparent),
        gapPadding: 15,
        borderRadius: BorderRadius.circular(9999),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.secondary,
      selectionColor: AppColors.secondary.toOpacity(0.2),
      selectionHandleColor: AppColors.secondary,
    ),
  );
}
