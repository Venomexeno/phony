import 'package:flutter/material.dart';

import '../../../../core/models/device.dart';
import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../controllers/get_device_details_cubit/get_device_details_cubit.dart';
import '../widgets/device_details_screen_body.dart';
import '../widgets/get_device_details_bloc_builder.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetDeviceDetailsBlocBuilder(
        device: device,
        builder: (state) {
          final bool isSuccess = state is GetDeviceDetailsSuccess;
          return CustomSkeletonizer(
            enabled: !isSuccess,
            child: DeviceDetailsScreenBody(
              deviceDetails: isSuccess ? state.deviceDetails : deviceDetailsSkeletonData(),
            ),
          );
        },
      ),
    );
  }
}
