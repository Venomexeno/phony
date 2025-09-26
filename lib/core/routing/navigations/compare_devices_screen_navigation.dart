import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../features/compare/controllers/compare_devices_cubit/compare_devices_cubit.dart';
import '../../../features/compare/view/screens/compare_screen.dart';
import '../../models/detailed_device.dart';
import '../navigation_methods_extension.dart';
import '../navigation_type.dart';

extension CompareDevicesScreenNavigation on BuildContext {
  void navigateToCompareDevicesScreen({
    required DetailedDevice device,
  }) {
    navigate(
      screen: BlocProvider<CompareDevicesCubit>(
        create: (context) => sl<CompareDevicesCubit>(),
        child: CompareScreen.hasScaffold(firstDevice: device),
      ),
      navigationType: PushNavigation(),
    );
  }
}
