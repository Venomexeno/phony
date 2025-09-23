import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/exception_widget.dart';
import '../../../home/data/models/brand.dart';
import '../../controllers/get_brand_devices_cubit/get_brand_devices_cubit.dart';

class GetBrandDevicesBlocBuilder extends StatelessWidget {
  const GetBrandDevicesBlocBuilder({
    super.key,
    required this.brand,
    required this.builder,
  });

  final Brand brand;
  final Widget Function(GetBrandDevicesState state) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBrandDevicesCubit, GetBrandDevicesState>(
      builder: (context, state) {
        if (state is GetBrandDevicesFailure) {
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
    context.read<GetBrandDevicesCubit>().getBrandDevices(brand);
  }
}
