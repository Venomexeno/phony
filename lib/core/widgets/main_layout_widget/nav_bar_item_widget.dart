import 'package:flutter/material.dart';
import '../../../dependencies/app_theme/get_app_theme/get_app_theme_cubit.dart';
import '../../models/main_layout_item.dart';
import '../../style/app_colors.dart';
import '../../style/app_text_styles.dart';

class NavBarItemWidget extends StatelessWidget {
  const NavBarItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final MainLayoutItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Icon(
              item.icon,
              size: 24,
              color: _iconColor,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular14.copyWith(
                color: _iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get _iconColor => GetAppThemeCubit.isDark
      ? isSelected
            ? AppColors.light
            : AppColors.color6B7280
      : isSelected
      ? AppColors.color1F2937
      : AppColors.color6B7280;
}
