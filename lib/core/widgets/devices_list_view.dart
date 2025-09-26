import 'package:flutter/material.dart';
import '../models/device.dart';
import '../models/device_interface.dart';
import 'custom_list_view.dart';
import 'device_item_widget.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({
    super.key,
    required this.devices,
    this.onSelectDevice,
  });

  final List<Device> devices;
  final void Function(DeviceInterface device)? onSelectDevice;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      items: devices,
      itemBuilder: (context, index) {
        final device = devices[index];
        return DeviceItemWidget(
          onTap: onSelectDevice,
          device: device,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }
}
