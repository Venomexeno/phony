import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_list_view.dart';
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
    return CustomListView<HotDealDevice>(
      items: hotDealDevices,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => HotDealDeviceItemWidget(hotDealDevice: hotDealDevices[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
