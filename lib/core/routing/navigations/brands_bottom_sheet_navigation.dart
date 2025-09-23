import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/controllers/get_brands_cubit/get_brands_cubit.dart';
import '../../../features/home/view/widgets/brands_bottom_sheet.dart';
import '../../di/service_locator.dart';
import '../../functions/functions.dart';

extension BrandsBottomSheetNavigation on BuildContext {
  void navigateToBrandsBottomSheet() {
    showMyModalBottomSheet(
      context: this,
      builder: (context) => BlocProvider.value(
        value: sl<GetBrandsCubit>()..getBrands(),
        child: BrandsBottomSheet(),
      ),
    );
  }
}
