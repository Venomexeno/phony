import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_list_view.dart';
import '../../data/models/brand.dart';
import 'brand_item_widget.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({
    super.key,
    required this.brands,
  });

  final List<Brand> brands;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      items: brands,
      itemBuilder: (context, index) {
        final brand = brands[index];
        return BrandItemWidget(brand: brand);
      },
      separatorBuilder: (context, index) => CustomDivider(),
    );
  }
}
