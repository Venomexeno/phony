import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  /// هنا عملت كل ال text styles اللي انا ممكن استخدمها في الابلكيشن
  /// بس خليتهم كلهم get طب ليه وانا ممكن اخليها final 
  /// عشان كل مرة اليوزر يغير ال theme من light ل dark او العكس
  /// ال text color بيتغير ف لو خليتهم final هيبقى لونهم ثابت
  static TextStyle get bold24 => _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold22 => _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold20 => _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold18 => _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold16 => _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold14 => _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static TextStyle get bold12 => _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  // Semi Bold
  static TextStyle get semiBold24 => _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold22 => _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold20 => _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold18 => _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold16 => _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold14 => _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static TextStyle get semiBold12 => _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  // Medium
  static TextStyle get medium24 => _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium22 => _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium20 => _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium18 => _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium16 => _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium14 => _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static TextStyle get medium12 => _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  // Regular
  static TextStyle get regular24 => _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular22 => _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular20 => _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular18 => _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular16 => _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular14 => _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular12 => _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static TextStyle get regular10 => _textStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static Color _getTextColor({
    Color light = AppColors.color1F2937,
    Color dark = AppColors.light,
  }) => AppThemeCubit.isDark ? dark : light;
}

TextStyle _textStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.inter(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
