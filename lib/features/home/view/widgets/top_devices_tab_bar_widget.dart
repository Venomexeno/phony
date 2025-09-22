import 'package:flutter/material.dart';

import '../../data/enums/top_devices_enum.dart';
import 'top_devices_tab_bar_item_widget.dart';

class TopDevicesTabBarWidget extends StatelessWidget {
  const TopDevicesTabBarWidget({
    super.key,
    required this.selectedTopDevicesEnum,
    required this.onTap,
  });

  final TopDevicesEnum selectedTopDevicesEnum;
  final void Function(TopDevicesEnum onChangedTab) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TopDevicesTabBarItemWidget(
            topDevices: TopDevicesEnum.fans,
            isSelected: selectedTopDevicesEnum.isFans,
            onTap: onTap,
          ),
        ),
        Expanded(
          child: TopDevicesTabBarItemWidget(
            topDevices: TopDevicesEnum.dailyInterest,
            isSelected: selectedTopDevicesEnum.isDailyHits,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
