import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../style/app_text_styles.dart';
import 'custom_search_bar.dart';

class BaseListWithSearchableWidget<T> extends StatelessWidget {
  const BaseListWithSearchableWidget({
    super.key,
    required this.items,
    this.title,
    required this.onChanged,
    required this.listView,
  });

  final List<T> items;
  final String? title;
  final void Function(String value) onChanged;
  final Widget listView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Skeleton.keep(
            child: Text(
              title!,
              style: AppTextStyles.bold16,
            ),
          ),
        SizedBox(height: 8),
        Skeleton.replace(
          replacement: SizedBox.shrink(),
          child: CustomSearchBar(
            onChanged: onChanged,
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: listView,
        ),
      ],
    );
  }
}
