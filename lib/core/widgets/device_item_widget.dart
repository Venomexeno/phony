import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/device_interface.dart';
import 'base_device_item_widget.dart';
import 'device_info_widget.dart';

class DeviceItemWidget extends StatelessWidget {
  const DeviceItemWidget({
    super.key,
    required this.device,
    this.onTap,
  });

  final Device device;
  final void Function(DeviceInterface device)? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseDeviceItemWidget(
      onTap: onTap,
      device: device,
      trailing: DeviceInfoWidget(device: device),
    );
  }
}
