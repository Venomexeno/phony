import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../data/models/hot_deal_device.dart';
import 'discount_widget.dart';

class DiscountInfoWidget extends StatelessWidget {
  const DiscountInfoWidget({
    super.key,
    required this.hotDealDevice,
  });

  final HotDealDevice hotDealDevice;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(
          "${hotDealDevice.deal.currency}${hotDealDevice.deal.price}",
          style: _priceTextStyle,
        ),

        Text(
          "${hotDealDevice.deal.currency}${hotDealDevice.originalPrice}",
          style: _originalPriceTextStyle,
        ),

        DiscountWidget(hotDealDevice: hotDealDevice),
      ],
    );
  }

  TextStyle get _originalPriceTextStyle => AppTextStyles.regular12.copyWith(
    color: AppColors.grey400,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.grey400,
  );

  TextStyle get _priceTextStyle => AppTextStyles.bold18.copyWith(
    color: AppColors.secondary,
  );
}
