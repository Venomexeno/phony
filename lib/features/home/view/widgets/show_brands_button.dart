import 'package:flutter/material.dart';
import '../../../../core/routing/navigations/brands_bottom_sheet_navigation.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class ShowBrandsButton extends StatelessWidget {
  const ShowBrandsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateToBrandsBottomSheet(),
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(4),
        decoration: _decoration,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(Icons.apps),
        ),
      ),
    );
  }

  BoxDecoration get _decoration => AppBoxDecorations.solid(
    color: AppThemeCubit.isDark ? AppColors.color283039 : AppColors.colore5e7eb,
    shape: BoxShape.circle,
    withShadow: false,
    borderRadius: BorderRadius.circular(10),
  );
}
