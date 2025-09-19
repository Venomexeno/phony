import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static final TextStyle bold24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static final TextStyle bold22 = _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static final TextStyle bold20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static final TextStyle bold18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static final TextStyle bold16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.color1F2937,
  );

  static final TextStyle bold14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  static final TextStyle bold12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: _getTextColor(),
  );

  // Semi Bold
  static final TextStyle semiBold24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold22 = _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  static final TextStyle semiBold12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: _getTextColor(),
  );

  // Medium
  static final TextStyle medium24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium22 = _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  static final TextStyle medium12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _getTextColor(),
  );

  // Regular
  static final TextStyle regular24 = _textStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular22 = _textStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular20 = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular18 = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular16 = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular14 = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular12 = _textStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static final TextStyle regular10 = _textStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: _getTextColor(),
  );

  static Color _getTextColor({
    Color light = AppColors.light,
    Color dark = AppColors.color1F2937,
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
