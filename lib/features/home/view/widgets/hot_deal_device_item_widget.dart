import 'package:flutter/material.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../data/models/hot_deal_device.dart';
import 'deal_info_widget.dart';

class HotDealDeviceItemWidget extends StatelessWidget {
  const HotDealDeviceItemWidget({super.key, required this.hotDealDevice});

  final HotDealDevice hotDealDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      child: Column(
        children: [
          DeviceImageWidget(
            device: hotDealDevice,
            width: double.infinity,
            height: 200,
            borderRadius: _borderRadius,
          ),
          DealInfoWidget(hotDealDevice: hotDealDevice),
        ],
      ),
    );
  }

  BorderRadius get _borderRadius => BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );

  BoxDecoration get _boxDecoration => AppBoxDecorations.outLined(
    borderColor: AppThemeCubit.isDark ? AppColors.grey700 : AppColors.grey200,
    color: AppThemeCubit.isDark ? AppColors.color1a242e : AppColors.colorf6f7f8,
  );
}
