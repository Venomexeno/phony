import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device_interface.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/api_helper.dart';
import '../models/compare_result.dart';

abstract class CompareRemoteDataSource {
  Future<CompareResult> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  );
}

class CompareRemoteDataSourceImpl implements CompareRemoteDataSource {
  final ApiHelper _apiHelper;

  CompareRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<CompareResult> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  ) async {
    final firstDetailed = await _getDetailed(firstDevice);
    final secondDetailed = await _getDetailed(secondDevice);

    return CompareResult.fromMap({
      'firstDevice': firstDetailed.toMap,
      'secondDevice': secondDetailed.toMap,
    });
  }

  Future<DetailedDevice> _getDetailed(DeviceInterface device) async {
    if (device is DetailedDevice) return device;

    final response = await _apiHelper.get<Map<String, dynamic>>(
      endPoint: "${ApiK.deviceDetails}/${device.id}",
    );

    return DetailedDevice.fromMap({
      ...response,
      ...device.toMap,
    });
  }
}
