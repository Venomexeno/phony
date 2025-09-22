import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_sliver_list.dart';
import '../../data/models/hot_deal_device.dart';
import 'hot_deal_device_item_widget.dart';

class HotDealsListView extends StatelessWidget {
  const HotDealsListView({
    super.key,
    required this.hotDealDevices,
  });

  final List<HotDealDevice> hotDealDevices;

  @override
  Widget build(BuildContext context) {
    return CustomSliverListView<HotDealDevice>(
      items: hotDealDevices,
      itemBuilder: (context, index) {
        return HotDealDeviceItemWidget(hotDealDevice: hotDealDevices[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
