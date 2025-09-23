import 'package:flutter/material.dart';
import '../models/device.dart';
import '../style/app_colors.dart';
import '../style/app_text_styles.dart';

class DeviceInfoWidget extends StatelessWidget {
  const DeviceInfoWidget({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(device.name, style: AppTextStyles.semiBold18),
        Text(
          device.description,
          style: AppTextStyles.medium12.copyWith(color: AppColors.grey400),
        ),
      ],
    );
  }
}
