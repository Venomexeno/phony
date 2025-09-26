import 'package:flutter/material.dart';

import '../../../../core/extensions/color_opacity_extension.dart';
import '../../../../core/models/device_interface.dart';
import '../../../../core/routing/navigation_methods_extension.dart';
import '../../../../core/routing/navigations/search_screen_navigation.dart';
import '../../../../core/style/app_box_decorations.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/device_image_widget.dart';
import '../../../../dependencies/app_theme_cubit/app_theme_cubit.dart';

class CompareAddDeviceButton extends StatelessWidget {
  const CompareAddDeviceButton({
    super.key,
    this.device,
    required this.onSelectDevice,
  });

  final DeviceInterface? device;

  final void Function(DeviceInterface device) onSelectDevice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        alignment: Alignment.center,
        decoration: _decoration,
        height: MediaQuery.of(context).size.height * 0.3,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: device == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    _AddButton(),
                    Text("Add Device", style: _textStyle),
                  ],
                )
              : DeviceImageWidget(
                  hasHero: false,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  device: device!,
                ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    context.navigateToSearchScreen(
      onSelectDevice: (device) {
        onSelectDevice(device);
        context.pop();
      },
    );
  }

  TextStyle get _textStyle => AppTextStyles.medium14.copyWith();

  BoxDecoration get _decoration => AppBoxDecorations.solid(
    withShadow: false,
    color: device == null
        ? AppThemeCubit.isDark
              ? AppColors.color1a242e
              : AppColors.colorf6f7f8
        : AppColors.transparent,
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
