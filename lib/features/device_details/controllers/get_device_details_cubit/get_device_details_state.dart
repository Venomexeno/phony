part of 'get_device_details_cubit.dart';

sealed class GetDeviceDetailsState {}

final class GetDeviceDetailsInitial extends GetDeviceDetailsState {}

final class GetDeviceDetailsLoading extends GetDeviceDetailsState {}

final class GetDeviceDetailsSuccess extends GetDeviceDetailsState {
  final DetailedDevice deviceDetails;

  GetDeviceDetailsSuccess({required this.deviceDetails});
}

final class GetDeviceDetailsFailure extends GetDeviceDetailsState {
  final String message;

  GetDeviceDetailsFailure({required this.message});
}