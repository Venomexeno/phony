import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_sliver_grid.dart';
import '../../data/models/top_device_item.dart';
import 'top_device_item_widget.dart';

class TopDevicesGridView extends StatelessWidget {
  const TopDevicesGridView({
    super.key,
    required this.topDevices,
  });

  final List<TopDeviceItem> topDevices;

  @override
  Widget build(BuildContext context) {
    return CustomSliverGridView<TopDeviceItem>(
      items: topDevices,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return TopDeviceItemWidget(
          topDevice: topDevices[index],
        );
      },
    );
  }
}
