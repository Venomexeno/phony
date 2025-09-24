import 'package:flutter/material.dart';
import '../models/device.dart';
import 'custom_list_view.dart';
import 'device_item_widget.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({
    super.key,
    required this.devices,
  });

  final List<Device> devices;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      items: devices,
      itemBuilder: (context, index) {
        final device = devices[index];
        return DeviceItemWidget(device: device);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }
}
