import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.value,
    this.color,
    this.width,
    this.height,
  });

  final double? value;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color ?? AppColors.secondary,
          value: value,
        ),
      ),
    );
  }
}
