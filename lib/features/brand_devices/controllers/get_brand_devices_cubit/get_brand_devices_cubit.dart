
import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/device.dart';
import '../../../home/data/models/brand.dart';
import '../../data/repo/brand_devices_repo.dart';

part 'get_brand_devices_state.dart';

class GetBrandDevicesCubit extends CustomCubit<GetBrandDevicesState> {
  GetBrandDevicesCubit(this._brandDevicesRepo) : super(GetBrandDevicesInitial());

  final BrandDevicesRepo _brandDevicesRepo;

  Future<void> getBrandDevices(Brand brand) async {
    emit(GetBrandDevicesLoading());
    final brandDevicesOrFailure = await _brandDevicesRepo.getBrandDevices(brand);
    brandDevicesOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) => emit(
    GetBrandDevicesFailure(
      message: failure.message,
    ),
  );
  
  void _success(List<Device> devices) => emit(
    GetBrandDevicesSuccess(
      devices: devices,
    ),
  );
}

