import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../style/app_colors.dart';

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer._({ ///هنا خفيت ال constructor الاساسي عشان اجبر اي حد يستخدم الكونستراكتورز اللي تحت
    required this.enabled,
    required this.child,
    this.ignoreContainers = false,
    required this.isSliver,
  });
  final bool enabled;
  final Widget child;
  final bool ignoreContainers;
  final bool isSliver;

  /// هنا عملت 2 كونستراكتور واحد للسليفر وواحده للويدجيت العاديه

  factory CustomSkeletonizer.sliver({
    required bool enabled,
    required Widget child,
    bool ignoreContainers = false,
  }) {
    return CustomSkeletonizer._(
      enabled: enabled,
      ignoreContainers: ignoreContainers,
      isSliver: true,
      child: child,
    );
  }

  factory CustomSkeletonizer({
    required bool enabled,
    required Widget child,
    bool ignoreContainers = false,
  }) {
    return CustomSkeletonizer._(
      enabled: enabled,
      ignoreContainers: ignoreContainers,
      isSliver: false,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return Skeletonizer.sliver(
        enabled: enabled,
        ignoreContainers: ignoreContainers,
        containersColor: AppColors.grey500,
        effect: _effect,
        child: child,
      );
    }
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      ignoreContainers: ignoreContainers,
      containersColor: AppColors.grey500,
      effect: _effect,
      child: child,
    );
  }

  PaintingEffect get _effect => ShimmerEffect(
    baseColor: AppColors.grey200,
    highlightColor: AppColors.grey400,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    duration: const Duration(seconds: 3),
  );
}
