import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/models/device_interface.dart';
import '../data_source/compare_remote_data_source.dart';
import '../models/compare_result.dart';

abstract class CompareRepo {
  Future<Either<Failure, CompareResult>> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  );
}

class CompareRepoImpl implements CompareRepo {
  final CompareRemoteDataSource _compareRemoteDataSource;

  CompareRepoImpl(this._compareRemoteDataSource);

  @override
  Future<Either<Failure, CompareResult>> compareDevices(
    DeviceInterface firstDevice,
    DeviceInterface secondDevice,
  ) async {
    return await tryAndCatchBlock(
      functionToExecute: () async {
        return await _compareRemoteDataSource.compareDevices(
          firstDevice,
          secondDevice,
        );
      },
    );
  }
}
