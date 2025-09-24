import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/device_interface.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/get_device_details_cubit/get_device_details_cubit.dart';

class GetDeviceDetailsBlocBuilder extends StatelessWidget {
  const GetDeviceDetailsBlocBuilder({super.key, required this.device, required this.builder});

  final DeviceInterface device;
  final Widget Function(GetDeviceDetailsState state) builder;
  
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
        return builder(state);
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<GetDeviceDetailsCubit>().getDeviceDetails(device);
  }
}