import 'package:flutter/material.dart';

import 'device_details_favorite_button.dart';

class DeviceDetailsAppBar extends AppBar {
  DeviceDetailsAppBar({
    super.key,
  }) : super(
         title: Text('Device Details'),
         actions: [
          DeviceDetailsFavoriteButton(),
         ],
       );
}
