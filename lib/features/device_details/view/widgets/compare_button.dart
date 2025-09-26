import 'package:flutter/material.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/routing/navigations/compare_devices_screen_navigation.dart';
import '../../../../core/style/app_colors.dart';

class CompareButton extends StatelessWidget {
  const CompareButton({
    super.key,
    required this.detailedDevice,
  });

  final DetailedDevice detailedDevice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: AppColors.transparent,
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.secondary,
          side: BorderSide(color: AppColors.secondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: () {
          context.navigateToCompareDevicesScreen(device: detailedDevice);
        },
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.compare_arrows),
            Text("Compare with another device"),
          ],
        ),
      ),
    );
  }
}
