import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device.dart';
import '../../../../core/widgets/base_list_with_searchable_widget.dart';
import '../../../../core/widgets/devices_list_view.dart';
import '../../controllers/get_brand_devices_cubit/get_brand_devices_cubit.dart';

class BrandDevicesScreenBody extends StatelessWidget {
  const BrandDevicesScreenBody({super.key, required this.devices});

  final List<Device> devices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: BaseListWithSearchableWidget(
        items: devices,
        onChanged: (value) => _onChanged(context, value),
        listView: DevicesListView(devices: devices),
      ),
    );
  }

  void _onChanged(BuildContext context,String value) {
    context.read<GetBrandDevicesCubit>().searchForDevice(value);
  }

  EdgeInsets get _padding => EdgeInsets.symmetric(
    horizontal: 10,
  );
}
