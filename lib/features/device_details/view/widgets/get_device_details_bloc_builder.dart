import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device_interface.dart';
import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/get_device_details_cubit/get_device_details_cubit.dart';
import 'compare_button.dart';
import 'device_details_widget.dart';

class GetDeviceDetailsBlocBuilder extends StatelessWidget {
  const GetDeviceDetailsBlocBuilder({
    super.key,
    required this.device,
  });

  final DeviceInterface device;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeviceDetailsCubit, GetDeviceDetailsState>(
      builder: (context, state) {
        if (state is GetDeviceDetailsFailure) {
          return ExceptionWidget.requestFailure(
            message: state.message,
            onTryAgain: () => _onTryAgain(context),
          );
        }
        final bool isSuccess = state is GetDeviceDetailsSuccess;
        final detailedDevice = isSuccess
            ? state.deviceDetails
            : deviceDetailsSkeletonData();
        return CustomSkeletonizer(
          enabled: !isSuccess,
          child: Column(
            children: [
              CompareButton(detailedDevice: detailedDevice),
              DeviceDetailsWidget(
                deviceDetails: detailedDevice,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<GetDeviceDetailsCubit>().getDeviceDetails(device);
  }
}
