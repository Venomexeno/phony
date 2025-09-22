import 'package:flutter/material.dart';

import 'exception_widget.dart';

class CustomSliverListView<T> extends StatelessWidget {
  const CustomSliverListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.separatorBuilder,
  });

  final List<T> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SliverToBoxAdapter(
        child: ExceptionWidget.emptyList(message: 'No items'),
      );
    }
    return SliverList.separated(
      itemCount: items.length,

      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }
}
