import 'package:flutter/material.dart';
import '../models/device.dart';
import 'base_device_item_widget.dart';
import 'custom_list_view.dart';

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
        return BaseDeviceItemWidget(
          device: device,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }
}
