import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/get_top_devices_cubit/get_top_devices_cubit.dart';
import '../../data/enums/top_devices_enum.dart';
import 'top_devices_grid_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class GetTopDevicesBlocBuilder extends StatelessWidget {
  const GetTopDevicesBlocBuilder({
    super.key,
    required this.selectedTopDevicesEnum,
  });

  final TopDevicesEnum selectedTopDevicesEnum;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopDevicesCubit, GetTopDevicesState>(
      builder: (context, state) {
        if (state is GetTopDevicesFailure) {
          return SliverToBoxAdapter(
            child: ExceptionWidget.requestFailure(
              message: state.message,
              onTryAgain: () => _onTryAgain(context),
            ),
          );
        }

        final bool isSuccess = state is GetTopDevicesSuccess;

        return CustomSkeletonizer.sliver(
          enabled: !isSuccess,
          child: SliverAnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: TopDevicesGridView(
              key: ValueKey(selectedTopDevicesEnum),
              topDevices: isSuccess
                  ? (selectedTopDevicesEnum.isFans
                        ? state.topDevicesByFans.topDeviceItems
                        : state.topDevicesByInterest.topDeviceItems)
                  : topDevicesSkeletonData(),
            ),
          ),
        );
      },
    );
  }
}

void _onTryAgain(BuildContext context) {
  context.read<GetTopDevicesCubit>().getTopDevices();
}
