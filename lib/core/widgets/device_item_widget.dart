import 'package:flutter/material.dart';
import '../models/device.dart';
import 'base_device_item_widget.dart';
import 'device_info_widget.dart';

class DeviceItemWidget extends StatelessWidget {
  const DeviceItemWidget({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return BaseDeviceItemWidget(
      device: device,
      trailing: DeviceInfoWidget(device: device),
    );
  }
}
