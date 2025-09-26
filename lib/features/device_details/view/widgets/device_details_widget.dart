import 'package:flutter/material.dart';

import '../../../../core/models/detailed_device.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import 'device_spec_list_view.dart';

class DeviceDetailsWidget extends StatelessWidget {
  const DeviceDetailsWidget({super.key, required this.deviceDetails});

  final DetailedDevice deviceDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        for (var spec in deviceDetails.detailedSpecs)
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(spec.category, style: _categoryTextStyle),
              DeviceSpecListView(specs: spec.specifications),
            ],
          ),
      ],
    );
  }

  TextStyle get _categoryTextStyle => AppTextStyles.semiBold20.copyWith(
    color: AppColors.light,
  );
}
