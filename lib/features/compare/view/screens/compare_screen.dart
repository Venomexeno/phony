import 'package:flutter/material.dart';

import '../../../../core/models/device_interface.dart';
import '../widgets/compare_screen_body.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen._({
    required this.hasScaffold,
    required this.firstDevice,
  });

  final bool hasScaffold;
  final DeviceInterface? firstDevice;

  const CompareScreen.hasScaffold({required DeviceInterface firstDevice})
    : this._(
        hasScaffold: true,
        firstDevice: firstDevice,
      );

  const CompareScreen()
    : this._(
        hasScaffold: false,
        firstDevice: null,
      );

  @override
  Widget build(BuildContext context) {
    if (hasScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Compare Devices"),
        ),
        body: CompareScreenBody(
          hasScaffold: hasScaffold,
          firstDevice: firstDevice,
        ),
      );
    }
    return CompareScreenBody(
      hasScaffold: hasScaffold,
      firstDevice: firstDevice,
    );
  }
}
