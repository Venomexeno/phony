import 'package:flutter/material.dart';

import '../../../../core/widgets/base_list_with_searchable_widget.dart';
import '../../data/models/brand.dart';
import 'brands_list_view.dart';

class BrandsSearchableWidget extends StatefulWidget {
  const BrandsSearchableWidget({super.key, required this.brands});

  final List<Brand> brands;

  @override
  State<BrandsSearchableWidget> createState() => _BrandsSearchableWidgetState();
}

class _BrandsSearchableWidgetState extends State<BrandsSearchableWidget> {
  late List<Brand> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.brands;
  }

  void _onChanged(String value) {
    setState(() {
      _filteredItems = widget.brands
          .where(
            (item) => item.name.toLowerCase().contains(value.toLowerCase()),
          ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseListWithSearchableWidget(
      items: _filteredItems,
      onChanged: _onChanged,
      listView: BrandsListView(brands: _filteredItems),
    );
  }
}
