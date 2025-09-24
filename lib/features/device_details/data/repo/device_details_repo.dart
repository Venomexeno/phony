import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/models/detailed_device.dart';
import '../../../../core/models/device_interface.dart';
import '../data_source/device_details_remote_data_source.dart';

abstract class DeviceDetailsRepo {
  Future<Either<Failure, DetailedDevice>> getDeviceDetails(DeviceInterface device);
}

class DeviceDetailsRepoImpl implements DeviceDetailsRepo {
  final DeviceDetailsRemoteDataSource _deviceDetailsRemoteDataSource; 

  DeviceDetailsRepoImpl(this._deviceDetailsRemoteDataSource);

  @override
  Future<Either<Failure, DetailedDevice>> getDeviceDetails(DeviceInterface device) async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _deviceDetailsRemoteDataSource.getDeviceDetails(device),
    );
  }
}
