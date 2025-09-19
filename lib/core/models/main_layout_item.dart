import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class MainLayoutItem extends Equatable {
  final String title;
  final IconData icon;
  final Widget screen;

  const MainLayoutItem({
    required this.title,
    required this.icon,
    required this.screen,
  });

  @override
  List<Object?> get props => [
    title,
    icon,
    screen,
  ];
}
