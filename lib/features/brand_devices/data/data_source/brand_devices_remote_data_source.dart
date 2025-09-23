import '../../../../core/models/device.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';
import '../../../home/data/models/brand.dart';

abstract class BrandDevicesRemoteDataSource {
  Future<List<Device>> getBrandDevices(Brand brand);
}

class BrandDevicesRemoteDataSourceImpl implements BrandDevicesRemoteDataSource {
  final ApiHelper _apiHelper;

  BrandDevicesRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<List<Device>> getBrandDevices(Brand brand) async {
    final response = await _apiHelper.get<List<dynamic>>(
      endPoint: "${ApiK.brands}/${brand.id}",
    );

    return response.map((e) => Device.fromMap(e)).toList();
  }
}
