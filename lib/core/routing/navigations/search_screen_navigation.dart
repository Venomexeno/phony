import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/controllers/search_device_cubit/search_device_cubit.dart';
import '../../../features/search/view/screens/search_screen.dart';
import '../../di/service_locator.dart';
import '../../models/device_interface.dart';
import '../navigation_methods_extension.dart';
import '../navigation_type.dart';

extension SearchScreenNavigation on BuildContext {
  void navigateToSearchScreen({
    void Function(DeviceInterface device)? onSelectDevice,
  }) {
    navigate(
      screen: BlocProvider<SearchDeviceCubit>(
        create: (context) => sl<SearchDeviceCubit>(),
        child: SearchScreen(
          onSelectDevice: onSelectDevice,
        ),
      ),
      navigationType: PushNavigation(),
    );
  }
}
