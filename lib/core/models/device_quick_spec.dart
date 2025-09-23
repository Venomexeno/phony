import 'package:equatable/equatable.dart';

class DeviceQuickSpec extends Equatable {
  final String title;
  final String value;

  const DeviceQuickSpec({required this.title, required this.value});

  factory DeviceQuickSpec.fromMap(Map<String, dynamic> map) {
    return DeviceQuickSpec(
      title: map['name'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': title,
      'value': value,
    };
  }

  @override
  List<Object> get props => [
    title,
    value,
  ];
}
