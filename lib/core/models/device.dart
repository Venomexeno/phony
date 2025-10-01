import 'device_interface.dart';

class Device extends DeviceInterface {

  /// هنا ب inherit
  /// من الانترفيس وبزود الحاجات اللي عايزها
  final String description;

  const Device({
    required super.id,
    required super.name,
    required super.image,
    required this.description,
  });

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'],
      name: map['name'],
      image: map['img'],
      description: map['description'],
    );
  }

  @override
  List<Object> get props => [
    ...super.props,
    description,
  ];
}
