part of 'get_top_devices_cubit.dart';

sealed class GetTopDevicesState {}

final class GetTopDevicesInitial extends GetTopDevicesState {}

final class GetTopDevicesLoading extends GetTopDevicesState {}

final class GetTopDevicesSuccess extends GetTopDevicesState {
  final TopDevicesByFans topDevicesByFans;
  final TopDevicesByInterest topDevicesByInterest;

  GetTopDevicesSuccess({
    required this.topDevicesByFans  ,
    required this.topDevicesByInterest,
  });
}

final class GetTopDevicesFailure extends GetTopDevicesState {
  final String message;

  GetTopDevicesFailure({required this.message});
}
