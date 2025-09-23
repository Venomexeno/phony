import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_searcbar.dart';
import 'show_brands_button.dart';

class DeviceFilterWidget extends StatelessWidget {
  const DeviceFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomSearcbar(),
        ),
        ShowBrandsButton(),
      ],
    );
  }
}
