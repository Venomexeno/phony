import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/hot_deal_device.dart';
import '../../data/repo/home_repo.dart';

part 'get_hot_deals_state.dart';

class GetHotDealsCubit extends CustomCubit<GetHotDealsState> {
  GetHotDealsCubit(this._homeRepo) : super(GetHotDealsInitial());

  final HomeRepo _homeRepo;

  Future<void> getHotDealDevices() async {
    emit(GetHotDealsLoading());
    final hotDealDevicesOrFailure = await _homeRepo.getHotDealDevices();
    hotDealDevicesOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) => emit(
    GetHotDealsFailure(
      message: failure.message,
    ),
  );

  void _success(List<HotDealDevice> hotDealDevices) => emit(
    GetHotDealsSuccess(
      hotDealDevices: hotDealDevices,
    ),
  );
}
