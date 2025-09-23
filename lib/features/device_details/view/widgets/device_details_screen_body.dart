import 'package:flutter/widgets.dart';

import '../../../../core/models/detailed_device.dart';

class DeviceDetailsScreenBody extends StatelessWidget {
  const DeviceDetailsScreenBody({super.key, required this.deviceDetails});
  
  final DetailedDevice deviceDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) => Text('Device Details')),
    );
  }
}
