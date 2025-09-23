import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/device.dart';
import '../../data/repo/search_repo.dart';

part 'search_device_state.dart';

class SearchDeviceCubit extends CustomCubit<SearchDeviceState> {
  SearchDeviceCubit(this._searchDeviceRepo) : super(SearchDeviceInitial());

  final SearchRepo _searchDeviceRepo;

  final Map<String, List<Device>> _results = {};

  final Map<String, bool?> _currentlyRequesting = {};

  String _currentRequest = '';

  Future<void> searchDevices(String query) async {
    if (query.isEmpty) return;

    _currentRequest = query;

    if (_results[query] != null) {
      _currentlyRequesting[query] = null;
      _success(_results[query]!);
      return;
    }

    emit(SearchDeviceLoading());
    final searchDevicesOrFailure = await _searchDeviceRepo.searchDevices(query);
    searchDevicesOrFailure.fold(
      _failure,
      (devices) {
        _results[query] = devices;

        if (query != _currentRequest) return;

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
