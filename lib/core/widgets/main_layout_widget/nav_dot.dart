import 'package:flutter/material.dart';

class NavDot extends StatelessWidget {
  const NavDot({
    super.key,
    required this.color,
    this.size = 12,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
