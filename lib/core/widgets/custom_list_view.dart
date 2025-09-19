import 'package:flutter/material.dart';

import 'exception_widget.dart';

class CustomListView<T> extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  });

  final List<T> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separatorBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return ExceptionWidget.emptyList(message: 'No items');
    }
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      reverse: reverse,
    );
  }
}
