import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';
import '../models/hot_deal_device.dart';
import '../models/top_device_item.dart';
import '../models/top_devices_section.dart';

abstract class HomeRemoteDataSource {
  Future<List<HotDealDevice>> getHotDealDevices();

  Future<List<TopDevicesSection>> getTopDevices();

  Future<String> getTopDeviceImage(TopDeviceItem device);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiHelper _apiHelper;

  HomeRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<List<HotDealDevice>> getHotDealDevices() async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.deals,
    );

    return response.map((e) => HotDealDevice.fromJson(e)).toList();
  }

  @override
  Future<List<TopDevicesSection>> getTopDevices() async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.topDevices,
    );

    return response.map((e) => TopDevicesSection.fromMap(e)).toList();
  }

  @override
  Future<String> getTopDeviceImage(TopDeviceItem device) async {
    final response = await _apiHelper.get<Map<String, dynamic>>(
      endPoint: "${ApiK.deviceDetails}/${device.id}",
    );

    return response['img'] ?? '';
  }
}
