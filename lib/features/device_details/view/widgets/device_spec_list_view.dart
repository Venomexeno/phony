import 'package:flutter/material.dart';
import '../../../../core/models/device_quick_spec.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_list_view.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class DeviceSpecListView extends StatelessWidget {
  const DeviceSpecListView({
    super.key,
    required this.specs,
  });

  final List<DeviceQuickSpec> specs;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      items: specs,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _itemBuilder,
      separatorBuilder: _separatorBuilder,
    );
  }

  Widget _itemBuilder(context, index) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            specs[index].title,
            style: _titleTextStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            specs[index].value,
            style: _valueTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _separatorBuilder(context, index) {
    return CustomDivider(
      color: AppThemeCubit.isDark ? AppColors.grey500 : AppColors.grey200,
    );
  }

  TextStyle get _titleTextStyle => AppTextStyles.medium14.copyWith(
    color: AppColors.grey500,
  );

  TextStyle get _valueTextStyle => AppTextStyles.medium14.copyWith(
    color: AppColors.grey800,
  );
}
