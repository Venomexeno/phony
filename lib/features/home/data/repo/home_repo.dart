import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/hot_deal_device.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HotDealDevice>>> getHotDealDevices();
}

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<HotDealDevice>>> getHotDealDevices() async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _homeRemoteDataSource.getHotDealDevices(),
    );
  }
}
