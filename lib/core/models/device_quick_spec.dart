import 'package:equatable/equatable.dart';

class DeviceQuickSpec extends Equatable {
  final String title;
  final String value;

  const DeviceQuickSpec({required this.title, required this.value});

  factory DeviceQuickSpec.fromMap(Map<String, dynamic> map) {
    String title = (map['name'] as String).trim().replaceAll('"', '').replaceAll("'", '');
    String value = (map['value'] as String).trim().replaceAll('"', '').replaceAll("'", '');

    title = title.isEmpty ? 'undefined' : title;
    value = value.isEmpty ? 'undefined' : value;

    return DeviceQuickSpec(
      title: title,
      value: value,
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
