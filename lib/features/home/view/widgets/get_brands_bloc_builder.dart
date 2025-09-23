import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/skeletons/custom_skeletonizer.dart';
import '../../../../core/skeletons/skeletons.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../controllers/get_brands_cubit/get_brands_cubit.dart';
import 'brands_searchable_widget.dart';

class GetBrandsBlocBuilder extends StatelessWidget {
  const GetBrandsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBrandsCubit, GetBrandsState>(
      builder: (context, state) {
        if (state is GetBrandsFailure) {
          return ExceptionWidget.requestFailure(
            message: state.message,
            onTryAgain: () => _onTryAgain(context),
          );
        }

        final bool isSuccess = state is GetBrandsSuccess;

        return CustomSkeletonizer(
          enabled: !isSuccess,
          child: BrandsSearchableWidget(
            brands: isSuccess ? state.brands : brandsSkeletonData(),
          ),
        );
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<GetBrandsCubit>().getBrands();
  }
}
