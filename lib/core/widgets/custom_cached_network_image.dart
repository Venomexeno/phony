import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loading_widget.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) {
          return LoadingWidget();
        },
        errorWidget: (context, url, error) {
          return Icon(
            Icons.error,
            size: 20,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
