import 'package:flutter/material.dart';

import '../../../../core/models/device_interface.dart';
import '../widgets/device_details_app_bar.dart';
import '../widgets/device_details_screen_body.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({
    super.key,
    required this.device,
  });

  final DeviceInterface device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeviceDetailsAppBar(),
    
      body: DeviceDetailsScreenBody(device: device),
    );
  }
}
