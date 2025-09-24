import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device_interface.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';

abstract class DeviceDetailsRemoteDataSource {
  Future<DetailedDevice> getDeviceDetails(DeviceInterface device);
}

class DeviceDetailsRemoteDataSourceImpl implements DeviceDetailsRemoteDataSource {
  final ApiHelper _apiHelper;

  DeviceDetailsRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<DetailedDevice> getDeviceDetails(DeviceInterface device) async {
    final response = await _apiHelper.get<Map<String, dynamic>>(
      endPoint: "${ApiK.deviceDetails}/${device.id}",
    );

    return DetailedDevice.fromMap({
      ...response,
      ...device.toMap,
    });
  }
}
