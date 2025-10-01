import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/device.dart';
import '../../data/repo/search_repo.dart';

part 'search_device_state.dart';

class SearchDeviceCubit extends CustomCubit<SearchDeviceState> {
  SearchDeviceCubit(this._searchDeviceRepo) : super(SearchDeviceInitial());

  final SearchRepo _searchDeviceRepo;

  final Map<String, List<Device>> _results = {}; /// هنا بحفظ ال results عشان لو اليوزر عمل نفس ال search تاني متعملش request جديد

  final Map<String, bool?> _currentlyRequesting = {}; /// هنا بحفظ ال requests اللي شغالة عشان لو اليوزر عمل نفس ال search تاني متعملش request جديد

  String _currentRequest = ''; /// هنا بحفظ اخر request عشان لو اليوزر عمل search جديد قبل ما يخلص ال request القديم متعملش emit لل state بتاع ال request القديم

  Future<void> searchDevices(String query) async {
    if (query.isEmpty) return;

    _currentRequest = query; /// بحفظ اخر request

    if (_results[query] != null) { /// لو ال results موجودة قبل كده
      _currentlyRequesting[query] = null;
      _success(_results[query]!);
      return; /// بخرج من الفنكشن عشان متعملش request جديد
    }

    emit(SearchDeviceLoading());
    final searchDevicesOrFailure = await _searchDeviceRepo.searchDevices(query);
    searchDevicesOrFailure.fold(
      _failure,
      (devices) {
        _results[query] = devices; /// بحفظ ال results

        if (query != _currentRequest) return; /// لو ال request الحالي مش اخر request اتعمل متعملش emit لل state

        _success(devices);
      },
    );
  }

  void _failure(Failure failure) => emit(
    SearchDeviceFailure(
      message: failure.message,
    ),
  );

  void _success(List<Device> devices) => emit(
    SearchDeviceSuccess(
      devices: devices,
    ),
  );
}
