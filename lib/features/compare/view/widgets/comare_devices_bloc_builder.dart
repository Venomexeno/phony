import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device_interface.dart';
import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/compare_devices_cubit/compare_devices_cubit.dart';
import 'compare_result_widget.dart';

class ComareDevicesBlocBuilder extends StatelessWidget {
  const ComareDevicesBlocBuilder({
    super.key,
    required this.device,
    required this.secondDevice,
  });

  final DeviceInterface? device;
  final DeviceInterface? secondDevice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompareDevicesCubit, CompareDevicesState>(
      builder: (context, state) {
        if (state is CompareDevicesFailure) {
          return ExceptionWidget.requestFailure(
            message: state.message,
            onTryAgain: () => _onTryAgain(context),
          );
        }
        if (state is CompareDevicesSuccess || state is CompareDevicesLoading) {
          final bool isSuccess = state is CompareDevicesSuccess;

          final compareResult = isSuccess
              ? state.compareResult
              : compareResultSkeletonData();

          return CustomSkeletonizer(
            enabled: !isSuccess,
            child: CompareResultWidget(
              compareResult: compareResult,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<CompareDevicesCubit>().compareDevices(device!, secondDevice!);
  }
}
