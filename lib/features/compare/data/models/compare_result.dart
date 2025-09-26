import 'package:equatable/equatable.dart';

import '../../../../core/models/detailed_device.dart';

class CompareResult extends Equatable {
  final DetailedDevice firstDevice;
  final DetailedDevice secondDevice;

  const CompareResult({
    required this.firstDevice,
    required this.secondDevice,
  });

  factory CompareResult.fromMap(Map<String, dynamic> map) {
    return CompareResult(
      firstDevice: DetailedDevice.fromMap(map['firstDevice']),
      secondDevice: DetailedDevice.fromMap(map['secondDevice']),
    );
  }

  @override
  List<Object> get props => [
    firstDevice,
    secondDevice,
  ];
}
