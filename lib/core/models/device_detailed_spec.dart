import 'package:equatable/equatable.dart';

import 'device_quick_spec.dart';

class DeviceDetailedSpec extends Equatable {
  final String category;
  final List<DeviceQuickSpec> specifications;

  const DeviceDetailedSpec({
    required this.category,
    required this.specifications,
  });

  factory DeviceDetailedSpec.fromJson(Map<String, dynamic> json) {
    return DeviceDetailedSpec(
      category: json['category'],
      specifications: (json['specifications'] as List).map((spec) => DeviceQuickSpec.fromJson(spec)).toList(),
    );
  }

  @override
  List<Object> get props => [
    category,
    specifications,
  ];
}
