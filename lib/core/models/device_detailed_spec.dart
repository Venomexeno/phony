import 'package:equatable/equatable.dart';

import 'device_quick_spec.dart';

class DeviceDetailedSpec extends Equatable {
  final String category;
  final List<DeviceQuickSpec> specifications;

  const DeviceDetailedSpec({
    required this.category,
    required this.specifications,
  });

  factory DeviceDetailedSpec.fromMap(Map<String, dynamic> map) {
    return DeviceDetailedSpec(
      category: map['category'],
      specifications: (map['specifications'] as List).map((spec) => DeviceQuickSpec.fromMap(spec)).toList(),
    );
  }

  

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'specifications': specifications.map((spec) => spec.toMap()).toList(),
    };
  }

  @override
  List<Object> get props => [
    category,
    specifications,
  ];
}
