import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device_interface.dart';
import '../../data/models/compare_result.dart';
import '../../data/repo/compare_repo.dart';

part 'compare_devices_state.dart';

class CompareDevicesCubit extends CustomCubit<CompareDevicesState> {
  CompareDevicesCubit(this._compareRepo) : super(CompareDevicesInitial());

  final CompareRepo _compareRepo;

  final Map<String, DetailedDevice> _cachedDevices = {};

  Future<void> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  ) async {
     if (firstDevice.isDetailedDevice) {
      _cachedDevices[firstDevice.id] = firstDevice.asDetailedDevice;
    }

    final first = _cachedDevices[firstDevice.id] ?? firstDevice;
    final second = _cachedDevices[secondDevice.id] ?? secondDevice;

   

    emit(CompareDevicesLoading());

    final compareDevicesOrFailure = await _compareRepo.compareDevices(
      first,
      second,
    );

    compareDevicesOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) {
    emit(CompareDevicesFailure(message: failure.message));
  }

  void _success(CompareResult compareResult) {
    _cachedDevices[compareResult.firstDevice.id] = compareResult.firstDevice;
    _cachedDevices[compareResult.secondDevice.id] = compareResult.secondDevice;

    emit(CompareDevicesSuccess(compareResult: compareResult));
  }
}
