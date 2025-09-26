import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../data/extensions/compare_result_specs.dart';
import '../../data/models/compare_result.dart';

class CompareResultWidget extends StatelessWidget {
  const CompareResultWidget({
    super.key,
    required this.compareResult,
  });

  final CompareResult compareResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: compareResult.compareSpecs.asMap().entries.map((entry) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.value.title, style: _titleTextStyle),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        entry.value.firstValue,
                        style: _valueTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.value.secondValue,
                        style: _valueTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (!_isLast(entry.key))
              CustomDivider(
                color: AppThemeCubit.isDark
                    ? AppColors.grey500
                    : AppColors.grey200,
              ),
          ],
        );
      }).toList(),
    );
  }

  TextStyle get _titleTextStyle => AppTextStyles.semiBold16.copyWith(
    color: AppThemeCubit.isDark
        ? AppColors.darkSlate400
        : AppColors.lightSlate600,
  );

  TextStyle get _valueTextStyle => AppTextStyles.medium14.copyWith(
    color: AppThemeCubit.isDark
        ? AppColors.light
        : AppColors.slate800,
  );

  bool _isLast(int index) {
    return index == compareResult.compareSpecs.length - 1;
  }
}
