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
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: ApiK.topDevices,
    );

    return response.map((e) => TopDevices.fromMap(e)).toList();
  }
}
