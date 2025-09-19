import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../extensions/color_opacity_extension.dart';
import '../style/app_colors.dart';
import 'loading_widget.dart';

class BlockInteractionLoadingWidget extends StatelessWidget {
  const BlockInteractionLoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
    this.color,
  });

  final Widget child;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.secondary.toOpacity(0.2),
            child: LoadingWidget(color: color),
          ),
      ],
    );
  }
}
