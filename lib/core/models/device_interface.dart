import 'package:equatable/equatable.dart';

import 'detailed_device.dart';

abstract class DeviceInterface extends Equatable {
  final String id;
  final String name;
  final String image;

  const DeviceInterface({
    required this.id,
    required this.name,
    required this.image,
  });

  bool get isDetailedDevice => this is DetailedDevice;
  DetailedDevice get asDetailedDevice => this as DetailedDevice;

  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'image': image,
  };

  @override
  List<Object> get props => [
    id,
    name,
    image,
  ];
}
