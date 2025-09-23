import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/models/device.dart';
import '../../../home/data/models/brand.dart';
import '../data_source/brand_devices_remote_data_source.dart';

abstract class BrandDevicesRepo {
  Future<Either<Failure, List<Device>>> getBrandDevices(Brand brand);
}

class BrandDevicesRepoImpl implements BrandDevicesRepo {
  final BrandDevicesRemoteDataSource _brandDevicesRemoteDataSource;

  BrandDevicesRepoImpl(this._brandDevicesRemoteDataSource);

  @override
  Future<Either<Failure, List<Device>>> getBrandDevices(Brand brand) async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _brandDevicesRemoteDataSource.getBrandDevices(brand),
    );
  }
}
