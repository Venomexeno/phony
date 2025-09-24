import 'detailed_device.dart';
import 'device_interface.dart';

class Device extends DeviceInterface {
  final String description;

  const Device({
    required super.id,
    required super.name,
    required super.image,
    required this.description,
  });

  bool get isDetailedDevice => this is DetailedDevice;

  DetailedDevice get asDetailedDevice => this as DetailedDevice;

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'],
      name: map['name'],
      image: map['img'],
      description: map['description'],
    );
  }

  Map<String, dynamic> get toMap => {
    'id': id,
    'description': description,
  };

  @override
  List<Object> get props => [
    ...super.props,
    description,
  ];
}
