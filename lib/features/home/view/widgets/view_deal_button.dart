import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../data/models/hot_deal_device.dart';

class ViewDealButton extends StatelessWidget {
  const ViewDealButton({
    super.key,
    required this.hotDealDevice,
  });

  final HotDealDevice hotDealDevice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onPressed,
        child: Text(
          'View Deal',
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.light,
          ),
        ),
      ),
    );
  }

  void _onPressed() => launchUrl(Uri.parse(hotDealDevice.url));
}
