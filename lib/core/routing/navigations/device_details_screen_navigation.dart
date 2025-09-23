import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/device_details/controllers/get_device_details_cubit/get_device_details_cubit.dart';
import '../../../features/device_details/view/screens/device_details_screen.dart';
import '../../di/service_locator.dart';
import '../../models/device.dart';
import '../navigation_methods_extension.dart';
import '../navigation_type.dart';

extension DeviceDetailsScreenNavigation on BuildContext {
  void navigateToDeviceDetailsScreen({
    required Device device,
  }) {
    navigate(
      screen: BlocProvider<GetDeviceDetailsCubit>(
        create: (context) => sl<GetDeviceDetailsCubit>()..getDeviceDetails(device),
        child: DeviceDetailsScreen(device: device),
      ),
      navigationType: PushNavigation(),
    );
  }
}
