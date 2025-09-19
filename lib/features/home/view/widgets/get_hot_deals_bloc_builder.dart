import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/exception_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../controllers/get_hot_deals_cubit/get_hot_deals_cubit.dart';
import 'hot_deals_list_view.dart';

class GetHotDealsBlocBuilder extends StatelessWidget {
  const GetHotDealsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHotDealsCubit, GetHotDealsState>(
      builder: (context, state) {
        if (state is GetHotDealsFailure) {
          return ExceptionWidget.requestFailure(
            message: state.message,
            onTryAgain: () => _onTryAgain(context),
          );
        } else if (state is GetHotDealsSuccess) {
          return HotDealsListView(
            hotDealDevices: state.hotDealDevices,
          );
        }
        return LoadingWidget();
      },
    );
  }

  void _onTryAgain(BuildContext context) {
    context.read<GetHotDealsCubit>().getHotDealDevices();
  }
}
