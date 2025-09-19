import 'package:flutter/material.dart';
import '../../../../core/models/device.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import 'favorite_device_info_widget.dart';
import 'remove_favorite_button.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(device.id);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: _boxDecoration,
        child: Row(
          spacing: 8,
          children: [
            DeviceImageWidget(device: device),
            Expanded(child: FavoriteDeviceInfoWidget(device: device)),
            RemoveFavoriteButton(device: device),
          ],
        ),
      ),
    );
  }

  BoxDecoration get _boxDecoration => AppBoxDecorations.outLined(
    borderColor: AppThemeCubit.isDark ? AppColors.grey700 : AppColors.grey200,
    color: AppThemeCubit.isDark ? AppColors.color1a242e : AppColors.colorf6f7f8,
  );
}
