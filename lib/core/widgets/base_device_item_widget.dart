import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../models/device_interface.dart';
import '../routing/navigations/device_details_screen_navigation.dart';

class BaseDeviceItemWidget extends StatelessWidget {
  const BaseDeviceItemWidget({
    super.key,
    required this.device,
    this.trailing,
    this.onTap,
  });

  final DeviceInterface device;
  final Widget? trailing;
  final void Function(DeviceInterface device)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  _onTap(context),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: _boxDecoration,
        child: Row(
          children: [
            Skeleton.ignore(
              child: DeviceImageWidget(
                device: device,
              ),
            ),
            const SizedBox(width: 8),
            if (trailing != null) Expanded(child: trailing!),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _boxDecoration => AppBoxDecorations.outLined(
    borderColor: AppThemeCubit.isDark ? AppColors.grey700 : AppColors.grey200,
    color: AppThemeCubit.isDark ? AppColors.color1a242e : AppColors.colorf6f7f8,
  );

  void _onTap(BuildContext context) {
    if (onTap != null) {
      onTap!(device);
      return;
    }
    context.navigateToDeviceDetailsScreen(device: device);
  }
}
