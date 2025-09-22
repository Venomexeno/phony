import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/top_device_item.dart';
import '../../data/models/top_devices_section.dart';
import '../../data/models/top_devices_by_fans.dart';
import '../../data/models/top_devices_by_interest.dart';
import '../../data/repo/home_repo.dart';

part 'get_top_devices_state.dart';

class GetTopDevicesCubit extends CustomCubit<GetTopDevicesState> {
  GetTopDevicesCubit(this._homeRepo) : super(GetTopDevicesInitial());

  final HomeRepo _homeRepo;

  /// cache: deviceId -> image
  final Map<String, String> _idToImage = {};
  final List<TopDevicesSection> _topDevicesSections = [];

  Future<void> getTopDevices() async {
    emit(GetTopDevicesLoading());

    if (_topDevicesSections.isNotEmpty) {
      _getDevicesImages();
      return;
    }

    final topDevicesOrFailure = await _homeRepo.getTopDevices();
    topDevicesOrFailure.fold(
      _failure,
      _getDevicesSuccess,
    );
  }

  void _failure(Failure failure) => emit(
    GetTopDevicesFailure(
      message: failure.message,
    ),
  );

  void _getDevicesSuccess(List<TopDevicesSection> topDevices) {
    _topDevicesSections.clear();
    _topDevicesSections.addAll(topDevices);
    _getDevicesImages();
  }

  Future<void> _getDevicesImages() async {
    final updatedDevices = <TopDevicesSection>[];

    for (var topDeviceSection in _topDevicesSections) {
      final updatedItems = <TopDeviceItem>[];

      for (var item in topDeviceSection.topDeviceItems) {
        late final String image;

        if (_idToImage.containsKey(item.id)) {
          image = _idToImage[item.id]!;
        } else {
          final imageOrFailure = await _homeRepo.getTopDeviceImage(item);
          imageOrFailure.fold(
            (failure) {
              _failure(failure);
              return;
            },
            (String img) {
              image = img;
              _idToImage[item.id] = img;
            },
          );

          if (image.isEmpty && !_idToImage.containsKey(item.id)) {
            return;
          }
        }

        updatedItems.add(item.updateImage(image: image));
      }

      updatedDevices.add(
        topDeviceSection.copyWith(topDeviceItems: updatedItems),
      );
    }

    final topDevicesByInterest = updatedDevices
        .firstWhere((device) => device.isTopDevicesByInterest)
        .asTopDevicesByInterest;

    final topDevicesByFans = updatedDevices.firstWhere((device) => device.isTopDevicesByFans).asTopDevicesByFans;

    _success(
      topDevicesByFans,
      topDevicesByInterest,
    );
  }

  void _success(TopDevicesByFans topDevicesByFans, TopDevicesByInterest topDevicesByInterest) => emit(
    GetTopDevicesSuccess(
      topDevicesByFans: topDevicesByFans,
      topDevicesByInterest: topDevicesByInterest,
    ),
  );
}
