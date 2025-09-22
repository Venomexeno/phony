import '../../../../core/models/device_interface.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';
import '../models/hot_deal_device.dart';
import '../models/top_devices.dart';

abstract class HomeRemoteDataSource {
  Future<List<HotDealDevice>> getHotDealDevices();

  Future<List<TopDevices>> getTopDevices();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiHelper _apiHelper;

  final Map<String, String> _idToImage = {}; // cache for deviceId -> imageUrl

  HomeRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<List<HotDealDevice>> getHotDealDevices() async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.deals,
    );

    return response.map((e) => HotDealDevice.fromJson(e)).toList();
  }

  @override
  Future<List<TopDevices>> getTopDevices() async {
    final devices = await _getTopDevices();

    final updatedDevices = <TopDevices>[];

    for (var device in devices) {
      // prepare a list of Futures to run all at once
      final futures = device.topDeviceItems.map((item) async {
        String image;

        if (_idToImage.containsKey(item.id)) {
          image = _idToImage[item.id]!;
        } else {
          image = await _getTopDeviceImage(item);
          _idToImage[item.id] = image;
        }

        return item.updateImage(image: image);
      }).toList();

      // run all the Futures together
      final updatedItems = await Future.wait(futures);

      updatedDevices.add(
        device.copyWith(topDeviceItems: updatedItems),
      );
    }

    return updatedDevices;
  }

  Future<List<TopDevices>> _getTopDevices() async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.topDevices,
    );

    return response.map((e) => TopDevices.fromMap(e)).toList();
  }

  Future<String> _getTopDeviceImage(DeviceInterface device) async {
    final response = await _apiHelper.get<Map<String, dynamic>>(
      endPoint: "${ApiK.deviceDetails}/${device.id}",
    );

    return response['img'] ?? '';
  }
}
