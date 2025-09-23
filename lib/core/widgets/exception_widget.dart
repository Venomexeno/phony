import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helpers/assets_helper.dart';
import '../style/app_colors.dart';
import '../style/app_text_styles.dart';
import 'try_again_button.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    super.key,
    required this.descriptionWidget,
    this.icon,
    this.actionWidget,
  });

  final Widget? icon;
  final Widget descriptionWidget;
  final Widget? actionWidget;

  factory ExceptionWidget.requestFailure({
    required String message,
    required VoidCallback onTryAgain,
  }) {
    return ExceptionWidget(
      actionWidget: TryAgainButton(onTryAgain: onTryAgain),
      descriptionWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Error !",
            style: AppTextStyles.bold22.copyWith(
              color: AppColors.red,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.color6B7280,
            ),
          ),
        ],
      ),
    );
  }

  factory ExceptionWidget.emptyList({
    required String message,
    Widget? actionWidget,
  }) {
    return ExceptionWidget(
      actionWidget: actionWidget,
      icon: Lottie.asset(
        AssetsHelper.emptyBox,
        width: 120,
        height: 120,
      ),
      descriptionWidget: Column(
        children: [
          Text(
            "Opps... It’s empty here!",
            style: AppTextStyles.bold22,
          ),
          const SizedBox(height: 7),
          Text(
            message,
            style: AppTextStyles.regular14,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.semiBold18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),

          icon ??Lottie.asset(
            AssetsHelper.sadFace,
            width: 80,
            height: 80,
          ),

          descriptionWidget,

          const SizedBox(height: 7),
          
          actionWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
