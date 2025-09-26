import 'package:flutter/material.dart';

import '../../../../core/models/device_interface.dart';
import '../widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, this.onSelectDevice,});

  final void Function(DeviceInterface device)? onSelectDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SearchScreenBody(onSelectDevice: onSelectDevice),
    );
  }
}
