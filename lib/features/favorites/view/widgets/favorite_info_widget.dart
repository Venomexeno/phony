import 'package:flutter/material.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';

class FavoriteInfoWidget extends StatelessWidget {
  const FavoriteInfoWidget({
    super.key,
    required this.device,
  });

  final DetailedDevice device;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          device.name,
          style: _nameTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          device.quickSpecsString,
          style: _quickSpecsTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  TextStyle get _nameTextStyle => AppTextStyles.semiBold16;

  TextStyle get _quickSpecsTextStyle => AppTextStyles.regular12.copyWith(color: AppColors.grey500);
}
