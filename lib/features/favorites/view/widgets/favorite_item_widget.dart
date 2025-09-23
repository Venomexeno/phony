import 'package:flutter/material.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/widgets/base_device_item_widget.dart';
import 'remove_favorite_button.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({
    super.key,
    required this.device,
  });

  final DetailedDevice device;

  @override
  Widget build(BuildContext context) {
    return BaseDeviceItemWidget(
      device: device,
      trailing: RemoveFavoriteButton(
        device: device,
      ),
    );
  }
 
}
