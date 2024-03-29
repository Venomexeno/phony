import 'package:clean_arc_phony/home/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/latest_devices.dart';

class GetLatestDevicesUseCase
    extends BaseUseCase<List<LatestDevices>, NoParameters> {
  final BaseLatestDevicesRepository baseLatestDevicesRepository;

  GetLatestDevicesUseCase(this.baseLatestDevicesRepository);

  @override
  Future<Either<Failure, List<LatestDevices>>> call(
      NoParameters parameters) async {
    return await baseLatestDevicesRepository.getLatestDevices();
  }
}
