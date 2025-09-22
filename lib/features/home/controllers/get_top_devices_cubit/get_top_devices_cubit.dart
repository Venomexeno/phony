import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/top_devices.dart';
import '../../data/models/top_devices_by_fans.dart';
import '../../data/models/top_devices_by_interest.dart';
import '../../data/repo/home_repo.dart';

part 'get_top_devices_state.dart';

class GetTopDevicesCubit extends CustomCubit<GetTopDevicesState> {
  GetTopDevicesCubit(this._homeRepo) : super(GetTopDevicesInitial());

  final HomeRepo _homeRepo;

  Future<void> getTopDevices() async {
    emit(GetTopDevicesLoading());
    final topDevicesOrFailure = await _homeRepo.getTopDevices();
    topDevicesOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) => emit(
    GetTopDevicesFailure(
      message: failure.message,
    ),
  );

  void _success(List<TopDevices> topDevices) {
    final topDevicesByInterest = topDevices.firstWhere((device) {

      return device.isTopDevicesByInterest;
    }).asTopDevicesByInterest;

    final topDevicesByFans = topDevices.firstWhere((device) {

      return device.isTopDevicesByFans;
    }).asTopDevicesByFans;

    emit(
      GetTopDevicesSuccess(
        topDevicesByFans: topDevicesByFans,
        topDevicesByInterest: topDevicesByInterest,
      ),
    );
  }
}
