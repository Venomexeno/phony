import 'package:equatable/equatable.dart';

class DeviceQuickSpec extends Equatable {
  final String title;
  final String value;

  const DeviceQuickSpec({required this.title, required this.value});

  factory DeviceQuickSpec.fromJson(Map<String, dynamic> json) {
    return DeviceQuickSpec(
      title: json['name'],
      value: json['value'],
    );
  }

  @override
  List<Object> get props => [
    title,
    value,
  ];
}
