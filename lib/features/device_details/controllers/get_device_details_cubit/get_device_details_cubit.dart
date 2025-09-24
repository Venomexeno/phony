
import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device_interface.dart';
import '../../data/repo/device_details_repo.dart';

part 'get_device_details_state.dart';

class GetDeviceDetailsCubit extends CustomCubit<GetDeviceDetailsState> {
  GetDeviceDetailsCubit(this._deviceDetailsRepo) : super(GetDeviceDetailsInitial());

  final DeviceDetailsRepo _deviceDetailsRepo;

  Future<void> getDeviceDetails(DeviceInterface device) async {
    emit(GetDeviceDetailsLoading());
    final deviceDetailsOrFailure = await _deviceDetailsRepo.getDeviceDetails(device);
    deviceDetailsOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) => emit(
    GetDeviceDetailsFailure(
      message: failure.message,
    ),
  );

  void _success(DetailedDevice deviceDetails) => emit(
    GetDeviceDetailsSuccess(deviceDetails: deviceDetails),
  );
}
