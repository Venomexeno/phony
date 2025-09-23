import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../../core/widgets/devices_list_view.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/search_device_cubit/search_device_cubit.dart';

class GetSearchDevicesBlocBuilder extends StatelessWidget {
  const GetSearchDevicesBlocBuilder({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDeviceCubit, SearchDeviceState>(
      builder: (context, state) {
        if (state is SearchDeviceFailure) {
          return ExceptionWidget.requestFailure(
            message: state.message,
            onTryAgain: () => _onTryAgain(context),
          );
        } else if (state is SearchDeviceLoading || state is SearchDeviceSuccess) {
          final bool isSuccess = state is SearchDeviceSuccess;
          return CustomSkeletonizer(
            enabled: !isSuccess,
            child: DevicesListView(
              devices: isSuccess ? state.devices : searchDevicesSkeletonData(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<SearchDeviceCubit>().searchDevices(controller.text);
  }
}
