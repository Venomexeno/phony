import 'device_interface.dart';

class Device extends DeviceInterface {
  final String description;

  const Device({
    required super.id,
    required super.name,
    required super.image,
    required this.description,
  });

  @override
  List<Object> get props => [
    ...super.props,
    description,
  ];
}
