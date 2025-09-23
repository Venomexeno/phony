import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/base_list_with_searchable_widget.dart';
import '../../controllers/get_brands_cubit/get_brands_cubit.dart';
import '../../data/models/brand.dart';
import 'brands_list_view.dart';

class BrandsSearchableWidget extends StatelessWidget {
  const BrandsSearchableWidget({super.key, required this.brands});

  final List<Brand> brands;

  @override
  Widget build(BuildContext context) {
    return BaseListWithSearchableWidget(
      items: brands,
      onChanged: (value) => _onChanged(context, value),
      listView: BrandsListView(brands: brands),
    );
  }

  void _onChanged(BuildContext context,String value) {
    context.read<GetBrandsCubit>().searchForBrand(value);
  }
}
