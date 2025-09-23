import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/brand_devices/controllers/get_brand_devices_cubit/get_brand_devices_cubit.dart';
import '../../../features/brand_devices/view/screens/brand_devices_screen.dart';
import '../../../features/home/data/models/brand.dart';
import '../../di/service_locator.dart';
import '../navigation_methods_extension.dart';
import '../navigation_type.dart';

extension BrandDevicesScreenNavigation on BuildContext {
  void navigateToBrandDevicesScreen({
    required Brand brand,
  }) {
    navigate(
      screen: BlocProvider<GetBrandDevicesCubit>(
        create: (context) => sl<GetBrandDevicesCubit>()..getBrandDevices(brand),
        child: BrandDevicesScreen(brand: brand),
      ),
      navigationType: PushNavigation(),
    );
  }
}
