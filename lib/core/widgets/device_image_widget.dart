import 'package:flutter/material.dart';
import '../models/device_interface.dart';
import 'custom_cached_network_image.dart';

class DeviceImageWidget extends StatelessWidget {
  const DeviceImageWidget({
    super.key,
    required this.device,
    this.width = 75,
    this.height = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.fit = BoxFit.cover,
  });

  final DeviceInterface device;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: device.id,
      child: CustomCachedNetworkImage(
        fit: fit,
        borderRadius: borderRadius,
        imageUrl: device.image,
        width: width,
        height: height,
      ),
    );
  }
}
