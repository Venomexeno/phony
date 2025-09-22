import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/functions/functions.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/hot_deal_device.dart';
import '../models/top_device_item.dart';
import '../models/top_devices_section.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HotDealDevice>>> getHotDealDevices();

  Future<Either<Failure, List<TopDevicesSection>>> getTopDevices();

  Future<Either<Failure, String>> getTopDeviceImage(TopDeviceItem device);
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

  @override
  Future<Either<Failure, List<TopDevicesSection>>> getTopDevices() async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _homeRemoteDataSource.getTopDevices(),
    );
  }

  @override
  Future<Either<Failure, String>> getTopDeviceImage(TopDeviceItem device) async {
    return await tryAndCatchBlock(
      functionToExecute: () async => await _homeRemoteDataSource.getTopDeviceImage(device),
    );
  }
}
