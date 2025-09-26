part of 'compare_devices_cubit.dart';

sealed class CompareDevicesState {}

final class CompareDevicesInitial extends CompareDevicesState {}

final class CompareDevicesLoading extends CompareDevicesState {}

final class CompareDevicesSuccess extends CompareDevicesState {
  final CompareResult compareResult;

  CompareDevicesSuccess({
    required this.compareResult,
  });
}

final class CompareDevicesFailure extends CompareDevicesState {
  final String message;

  CompareDevicesFailure({required this.message});
}
