import 'package:flutter/material.dart';

import '../../../../core/extensions/color_opacity_extension.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../data/models/hot_deal_device.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.hotDealDevice});

  final HotDealDevice hotDealDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: AppBoxDecorations.solid(
        color: Colors.red.toOpacity(0.2),
        borderRadius: BorderRadius.circular(999),
        withShadow: false,
      ),
      child: Text(
        '-${hotDealDevice.deal.discount}%',
        style: AppTextStyles.semiBold12.copyWith(
          color: AppColors.colorF87171,
        ),
      ),
    );
  }
}
