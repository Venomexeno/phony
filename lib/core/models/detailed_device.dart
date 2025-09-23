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

  factory DetailedDevice.fromMap(Map<String, dynamic> map) {
    return DetailedDevice(
      id: map['id'],
      name: map['name'],
      image: map['img'],
      description: map['description'],
      quickSpecs: (map['quickSpec'] as List).map((spec) => DeviceQuickSpec.fromMap(spec)).toList(),
      detailedSpecs: (map['detailSpec'] as List).map((spec) => DeviceDetailedSpec.fromMap(spec)).toList(),
    );
  }

  @override
  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'img': image,
    'description': description,
    'quickSpecs': quickSpecs.map((spec) => spec.toMap()).toList(),
    'detailedSpecs': detailedSpecs.map((spec) => spec.toMap()).toList(),
  };

  @override
  List<Object> get props => [
    ...super.props,
    quickSpecs,
    detailedSpecs,
  ];
}
