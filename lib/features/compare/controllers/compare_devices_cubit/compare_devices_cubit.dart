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

  final Map<String, DetailedDevice> _cachedDevices = {}; /// هنا بحفظ ال detailed devices اللي جتلي من ال api عشان لو اليوزر عمل compare لنفس الموبايل تاني متعملش request جديد

  Future<void> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  ) async {
     if (firstDevice.isDetailedDevice) { /// لو الموبايل الاول detailed device يعني عمل compare من صفحة ال device details
      _cachedDevices[firstDevice.id] = firstDevice.asDetailedDevice; /// بحفظه في ال cache
    }

    final first = _cachedDevices[firstDevice.id] ?? firstDevice; /// باخد الموبايل الاول من ال cache لو موجود لو مش موجود باخده من ال argument
    final second = _cachedDevices[secondDevice.id] ?? secondDevice; /// باخد الموبايل التاني من ال cache لو موجود لو مش موجود باخده من ال argument

   

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
    _cachedDevices[compareResult.firstDevice.id] = compareResult.firstDevice; /// بحفظ الموبايلات اللي جتلي من ال api في ال cache
    _cachedDevices[compareResult.secondDevice.id] = compareResult.secondDevice; /// بحفظ الموبايلات اللي جتلي من ال api في ال cache

    emit(CompareDevicesSuccess(compareResult: compareResult));
  }
}
