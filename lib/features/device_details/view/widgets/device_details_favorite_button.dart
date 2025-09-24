import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/get_device_details_cubit/get_device_details_cubit.dart';
import 'favorite_button.dart';

class DeviceDetailsFavoriteButton extends StatelessWidget {
  const DeviceDetailsFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeviceDetailsCubit, GetDeviceDetailsState>(
      builder: (context, state) {
        if (state is! GetDeviceDetailsSuccess) {
          return SizedBox.shrink();
        }
        
        return FavoriteButton(device: state.deviceDetails);
      },
    );
  }
}
