import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/style/app_text_styles.dart';
import '../../../../core/widgets/custom_searcbar.dart';
import '../../data/models/brand.dart';
import 'brands_list_view.dart';

class BrandsSearchableWidget extends StatefulWidget {
  const BrandsSearchableWidget({super.key, required this.brands});

  final List<Brand> brands;

  @override
  State<BrandsSearchableWidget> createState() => _BrandsSearchableWidgetState();
}

class _BrandsSearchableWidgetState extends State<BrandsSearchableWidget> {
  late final TextEditingController _searchController;
  late List<Brand> _filteredBrands;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredBrands = widget.brands;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _filteredBrands = widget.brands
          .where(
            (brand) => brand.name.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeleton.keep(
          child: Text(
            'Select a Brand',
            style: AppTextStyles.bold16,
          ),
        ),
        SizedBox(height: 8),
        Skeleton.replace(
          replacement: SizedBox.shrink(),
          child: CustomSearcbar(
            onChanged: _onSearchChanged,
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: BrandsListView(brands: _filteredBrands),
        ),
      ],
    );
  }
}
