part of 'get_brand_devices_cubit.dart';

sealed class GetBrandDevicesState {}

final class GetBrandDevicesInitial extends GetBrandDevicesState {}

final class GetBrandDevicesLoading extends GetBrandDevicesState {}

final class GetBrandDevicesSuccess extends GetBrandDevicesState {
  final List<Device> devices;

  GetBrandDevicesSuccess({required this.devices});
}

final class GetBrandDevicesFailure extends GetBrandDevicesState {
  final String message;

  GetBrandDevicesFailure({required this.message});
}