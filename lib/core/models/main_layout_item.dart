import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class MainLayoutItem extends Equatable {
  final String title;
  final IconData icon;
  final Widget screen;
  final VoidCallback? onTap;

  const MainLayoutItem({
    required this.title,
    required this.icon,
    required this.screen,
    this.onTap,
  });

  @override
  List<Object?> get props => [
    title,
    icon,
    screen,
    onTap,
  ];
}
