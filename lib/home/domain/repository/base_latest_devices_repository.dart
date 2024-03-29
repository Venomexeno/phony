import 'package:clean_arc_phony/home/domain/entities/latest_devices.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseLatestDevicesRepository {
  Future<Either<Failure, List<LatestDevices>>> getLatestDevices();
}
