import 'device_detailed_spec.dart';
import 'device_interface.dart';
import 'device_quick_spec.dart';

class DetailedDevice extends DeviceInterface {
  final List<DeviceQuickSpec> quickSpecs;
  final List<DeviceDetailedSpec> detailedSpecs;

  const DetailedDevice({
    required super.id,
    required super.name,
    required super.image,
    required this.quickSpecs,
    required this.detailedSpecs,
  });

  factory DetailedDevice.fromMap(Map<String, dynamic> map) {
    return DetailedDevice(
      id: map['id'],
      name: map['name'],
      image: map['img'],
      quickSpecs: (map['quickSpec'] as List).map((spec) => DeviceQuickSpec.fromMap(spec)).toList(),
      detailedSpecs: (map['detailSpec'] as List).map((spec) => DeviceDetailedSpec.fromMap(spec)).toList(),
    );
  }

  String get quickSpecsString => quickSpecs
      .map((spec) => spec.value)
      .where((value) => value.isNotEmpty && value != 'undefined')
      .take(4)
      .join(' ● ');


  List<DeviceQuickSpec> get detailedSpecsList => detailedSpecs.expand((spec) => spec.specifications).toList();

  @override
  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'img': image,
    'quickSpec': quickSpecs.map((spec) => spec.toMap()).toList(),
    'detailSpec': detailedSpecs.map((spec) => spec.toMap()).toList(),
  };

  @override
  List<Object> get props => [
    ...super.props,
    quickSpecs,
    detailedSpecs,
  ];
}
