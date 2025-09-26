import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/models/device_interface.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/device_image_widget.dart';
import 'get_device_details_bloc_builder.dart';

class DeviceDetailsScreenBody extends StatelessWidget {
  const DeviceDetailsScreenBody({super.key, required this.device});

  final DeviceInterface device;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DeviceImageWidget(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            device: device,
            fit: BoxFit.contain,
          ),
          _Padding(
            child: Text(
              device.name,
              style: AppTextStyles.semiBold18,
            ),
          ),
          _Padding(
            child: GetDeviceDetailsBlocBuilder(
              device: device,
            ),
          ),
         
        ],
      ),
    );
  }
}

class _Padding extends StatelessWidget {
  const _Padding({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}
