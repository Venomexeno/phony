import 'package:flutter/material.dart';

extension ColorOpacity on Color {
  Color toOpacity(double opacity) {
    return withValues(
      red: r,
      green: g,
      blue: b,
      alpha: opacity,
    );
  }
}
