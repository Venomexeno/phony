import 'package:flutter/material.dart';
import '../models/device.dart';
import 'custom_cached_network_image.dart';

class DeviceImageWidget extends StatelessWidget {
  const DeviceImageWidget({
    super.key,
    required this.device,
    this.width = 75,
    this.height = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  });

  final Device device;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
      fit: BoxFit.cover,
      borderRadius: borderRadius,
      imageUrl: device.image,
      width: width,
      height: height,
    );
  }
}
