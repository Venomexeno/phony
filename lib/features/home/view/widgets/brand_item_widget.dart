import 'package:flutter/material.dart';
import '../../../../core/routing/navigations/brand_devices_screen_navigation.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../data/models/brand.dart';

class BrandItemWidget extends StatelessWidget {
  const BrandItemWidget({super.key, required this.brand});

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateToBrandDevicesScreen(brand: brand),
      child: Row(
        children: [
          Expanded(
            child: Text(
              brand.name,
              style: AppTextStyles.medium24.copyWith(
                color: AppThemeCubit.isDark ? AppColors.light : AppColors.grey800,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                brand.numberOfDevices.toString(),
                style: AppTextStyles.medium12.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              Text(
                'devices',
                style: AppTextStyles.medium12.copyWith(
                  color: AppThemeCubit.isDark ? AppColors.grey400 : AppColors.grey500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
