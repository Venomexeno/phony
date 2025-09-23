import 'package:flutter/material.dart';

import '../../../../core/models/device.dart';
import '../../../../core/widgets/base_list_with_searchable_widget.dart';
import '../../../../core/widgets/devices_list_view.dart';

class BrandDevicesScreenBody extends StatefulWidget {
  const BrandDevicesScreenBody({super.key, required this.devices});

  final List<Device> devices;

  @override
  State<BrandDevicesScreenBody> createState() => _BrandDevicesScreenBodyState();
}

class _BrandDevicesScreenBodyState extends State<BrandDevicesScreenBody> {
  late List<Device> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.devices;
  }

  void _onChanged(String value) {
    setState(() {
      _filteredItems = widget.devices
          .where(
            (item) => item.name.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: BaseListWithSearchableWidget(
        items: _filteredItems,
        onChanged: _onChanged,
        listView: DevicesListView(devices: _filteredItems),
      ),
    );
  }

  EdgeInsets get _padding => EdgeInsets.symmetric(
    horizontal: 10,
  );
}
