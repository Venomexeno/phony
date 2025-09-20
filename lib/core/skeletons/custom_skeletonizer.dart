import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../style/app_colors.dart';

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer({
    super.key,
    required this.enabled,
    required this.child,
    this.ignoreContainers = false,
  });
  final bool enabled;
  final Widget child;
  final bool ignoreContainers;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      ignoreContainers: ignoreContainers,
      containersColor: AppColors.grey500,
      effect: ShimmerEffect(
        baseColor: AppColors.grey200,
        highlightColor: AppColors.grey400,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        duration: const Duration(seconds: 3),
      ),
      child: child,
    );
  }
}
