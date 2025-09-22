import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../data/enums/top_devices_enum.dart';

class TopDevicesTabBarItemWidget extends StatelessWidget {
  const TopDevicesTabBarItemWidget({
    super.key,
    required this.topDevices,
    required this.onTap,
    required this.isSelected,
  });

  final TopDevicesEnum topDevices;
  final void Function(TopDevicesEnum onChangedTab) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(topDevices),
      child: Column(
        spacing: 4,
        children: [
          Text(topDevices.title),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isSelected
                ? Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.secondary,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
