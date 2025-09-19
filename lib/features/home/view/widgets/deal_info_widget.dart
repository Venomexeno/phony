import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../data/models/hot_deal_device.dart';
import 'discount_info_widget.dart';
import 'view_deal_button.dart';

class DealInfoWidget extends StatelessWidget {
  const DealInfoWidget({
    super.key,
    required this.hotDealDevice,
  });

  final HotDealDevice hotDealDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hotDealDevice.name, style: AppTextStyles.bold16),
          Text(hotDealDevice.deal.memory, style: _descTextStyle),
          SizedBox(height: 10),
          DiscountInfoWidget(hotDealDevice: hotDealDevice),
          SizedBox(height: 10),
          ViewDealButton(hotDealDevice: hotDealDevice),
        ],
      ),
    );
  }

  EdgeInsets get _padding => EdgeInsets.all(10);

  TextStyle get _descTextStyle => AppTextStyles.regular14.copyWith(
    color: AppColors.grey400,
  );
}
