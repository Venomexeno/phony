import 'package:flutter/material.dart';

import 'exception_widget.dart';

class CustomSliverGridView<T> extends StatelessWidget {
  const CustomSliverGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.gridDelegate,
  });

  final List<T> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final SliverGridDelegate gridDelegate;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SliverToBoxAdapter(
        child: ExceptionWidget.emptyList(message: 'No items'),
      );
    }
    return SliverGrid.builder(
      itemCount: items.length,
      itemBuilder: itemBuilder,
      gridDelegate: gridDelegate,
    );
  }
}
