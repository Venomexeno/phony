import 'device.dart';
import 'device_detailed_spec.dart';
import 'device_quick_spec.dart';

class DetailedDevice extends Device {
  final List<DeviceQuickSpec> quickSpecs;
  final List<DeviceDetailedSpec> detailedSpecs;

  const DetailedDevice({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
    required this.quickSpecs,
    required this.detailedSpecs,
  });

  factory DetailedDevice.fromJson(Map<String, dynamic> json) {
    return DetailedDevice(
      id: json['id'],
      name: json['name'],
      image: json['img'],
      description: json['description'],
      quickSpecs: (json['quickSpecs'] as List)
          .map((spec) => DeviceQuickSpec.fromJson(spec))
          .toList(),
      detailedSpecs: (json['detailedSpecs'] as List)
          .map((spec) => DeviceDetailedSpec.fromJson(spec))
          .toList(),
    );
  }

  @override
  List<Object> get props => [
    ...super.props,
    quickSpecs,
    detailedSpecs,
  ];
}
