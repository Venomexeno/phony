import 'package:flutter/material.dart';

import '../extensions/color_opacity_extension.dart';
import 'app_colors.dart';

abstract class AppBoxDecorations {
  static BoxDecoration solid({
    bool withShadow = true,
    BoxShape shape = BoxShape.rectangle,
    Color color = AppColors.transparent,
    Color? shadowColor,
    BorderRadiusGeometry? borderRadius,
  }) => BoxDecoration(
    shape: shape,
    color: color,
    borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(10),
    boxShadow: !withShadow
        ? null
        : [
            BoxShadow(
              color: shadowColor ?? AppColors.grey700.toOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
  );

  static BoxDecoration outLined({
    BoxShape shape = BoxShape.rectangle,
    Color color = AppColors.transparent,
    Color borderColor = AppColors.transparent,
    BorderRadius? borderRadius,
    double borderWidth = 1,
  }) => BoxDecoration(
    color: color,
    shape: shape,
    borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(10),
    border: Border.all(
      width: borderWidth,
      color: borderColor,
    ),
  );
}
