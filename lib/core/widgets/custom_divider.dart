import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.indent = 0,
    this.endIndent = 0,
    this.thickness = 1,
    this.vertical = false,
    this.color,
  });

  final double indent;
  final double endIndent;
  final double thickness;
  final Color? color;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return VerticalDivider(
        color: color ?? AppColors.grey200,
        indent: indent,
        endIndent: endIndent,
        thickness: thickness,
      );
    }
    return Divider(
      color: color,
      indent: indent,
      endIndent: endIndent,
      thickness: thickness,
    );
  }
}
