import 'device_interface.dart';

class Device extends DeviceInterface {
  final String description;

  const Device({
    required super.id,
    required super.name,
    required super.image,
    required this.description,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      image: json['img'],
      description: json['description'],
    );
  }

  @override
  List<Object> get props => [
    ...super.props,
    description,
  ];
}
