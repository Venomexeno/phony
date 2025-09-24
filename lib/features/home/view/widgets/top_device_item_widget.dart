import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/routing/navigations/device_details_screen_navigation.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../data/models/top_device_item.dart';

class TopDeviceItemWidget extends StatelessWidget {
  const TopDeviceItemWidget({super.key, required this.topDevice});

  final TopDeviceItem topDevice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateToDeviceDetailsScreen(device: topDevice),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: _decoration,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Skeleton.ignore(
                child: DeviceImageWidget(
                  device: topDevice,
                  width: 50,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  topDevice.name,
                  style: _textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              "${topDevice.hits} Favorites",
              style: _hitsTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _decoration => AppBoxDecorations.solid(
    withShadow: false,
    color: AppThemeCubit.isDark ? AppColors.color1a242e : AppColors.colorf6f7f8,
  );

  TextStyle get _textStyle => AppTextStyles.medium14;

  TextStyle get _hitsTextStyle => AppTextStyles.regular12.copyWith(
    color: AppColors.color6B7280,
  );
}
