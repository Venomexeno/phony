import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';
import '../models/hot_deal_device.dart';

abstract class HomeRemoteDataSource {
  Future<List<HotDealDevice>> getHotDealDevices();
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
}
