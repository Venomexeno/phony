import 'package:flutter/material.dart';
import '../models/device.dart';
import 'custom_cached_network_image.dart';

class DeviceImageWidget extends StatelessWidget {
  const DeviceImageWidget({
    super.key,
    required this.device,
    this.width = 75,
    this.height = 100,
  });

  final Device device;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(10),
      imageUrl: device.image,
      width: width,
      height: height,
    );
  }
}
