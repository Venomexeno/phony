import 'package:flutter/material.dart';

import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../home/data/models/brand.dart';
import '../../controllers/get_brand_devices_cubit/get_brand_devices_cubit.dart';
import '../widgets/brand_devices_screen_body.dart';
import '../widgets/get_brand_devices_bloc_builder.dart';

class BrandDevicesScreen extends StatelessWidget {
  const BrandDevicesScreen({
    super.key,
    required this.brand,
  });

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.name),
      ),
      body: GetBrandDevicesBlocBuilder(
        brand: brand,
        builder: (state) {
          final bool isSuccess = state is GetBrandDevicesSuccess;
          return CustomSkeletonizer(
            enabled: !isSuccess,
            child: BrandDevicesScreenBody(
              devices: isSuccess ? state.devices : searchDevicesSkeletonData(),
            ),
          );
        },
      )
    );
  }


}
