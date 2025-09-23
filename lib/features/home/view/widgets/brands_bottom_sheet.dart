import 'package:flutter/material.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/custom_bottom_sheet.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import 'get_brands_bloc_builder.dart';

class BrandsBottomSheet extends StatelessWidget {
  const BrandsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      showGreyLine: true,
      backgroundColor: AppThemeCubit.isDark ? AppColors.dark : AppColors.light,
      child: GetBrandsBlocBuilder(),
    );
  }
}
