part of 'search_device_cubit.dart';

sealed class SearchDeviceState {}

final class SearchDeviceInitial extends SearchDeviceState {}

final class SearchDeviceLoading extends SearchDeviceState {}

final class SearchDeviceSuccess extends SearchDeviceState {
  final List<Device> devices;

  SearchDeviceSuccess({required this.devices});
}

final class SearchDeviceFailure extends SearchDeviceState {
  final String message;

  SearchDeviceFailure({required this.message});

}