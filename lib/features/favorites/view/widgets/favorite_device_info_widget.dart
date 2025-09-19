import 'package:flutter/material.dart';
import '../../../../core/models/device.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';

class FavoriteDeviceInfoWidget extends StatelessWidget {
  const FavoriteDeviceInfoWidget({
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
