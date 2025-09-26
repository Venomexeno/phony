import 'package:flutter/material.dart';

import 'compare_add_device_button.dart';

class CompareScreenBody extends StatelessWidget {
  const CompareScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: CompareAddDeviceButton(),
              ),
              Expanded(
                child: CompareAddDeviceButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
