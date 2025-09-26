import 'package:flutter/material.dart';

import '../../../../core/extensions/color_opacity_extension.dart';
import '../../../../core/models/device.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class CompareAddDeviceButton extends StatelessWidget {
  const CompareAddDeviceButton({
    super.key,
    this.device,
  });

  final Device? device;

  @override
  Widget build(BuildContext context) {
    if (device != null) {
      return DeviceImageWidget(
        hasHero: false,
        device: device!,
      );
    }
    return Container(
      alignment: Alignment.center,
      decoration: _decoration,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          _AddButton(),
          Text("Add Device", style: _textStyle),
        ],
      ),
    );
  }

  TextStyle get _textStyle => AppTextStyles.medium14.copyWith();

  BoxDecoration get _decoration => AppBoxDecorations.solid(
    withShadow: false,
    color: AppThemeCubit.isDark ? AppColors.color1a242e : AppColors.colorf6f7f8,
  );
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      padding: const EdgeInsets.all(15),
      child: Icon(Icons.add, color: AppColors.secondary),
    );
  }

  BoxDecoration get _decoration => AppBoxDecorations.solid(
    withShadow: false,
    shape: BoxShape.circle,
    color: AppColors.secondary.toOpacity(0.2),
  );
}
