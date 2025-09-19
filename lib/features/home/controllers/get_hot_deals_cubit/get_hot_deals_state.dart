part of 'get_hot_deals_cubit.dart';

sealed class GetHotDealsState {}

final class GetHotDealsInitial extends GetHotDealsState {}

final class GetHotDealsLoading extends GetHotDealsState {}

final class GetHotDealsSuccess extends GetHotDealsState {
  final List<HotDealDevice> hotDealDevices;

  GetHotDealsSuccess({required this.hotDealDevices});
}

final class GetHotDealsFailure extends GetHotDealsState {
  final String message;

  GetHotDealsFailure({required this.message});
}
