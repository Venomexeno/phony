
import '../../../../core/models/device_interface.dart';

class TopDeviceItem extends DeviceInterface {
  final int hits;

  const TopDeviceItem({
    required super.id,
    required super.name,
    required super.image,
    required this.hits,
  });

  factory TopDeviceItem.fromMap(Map<String, dynamic> map) {
    return TopDeviceItem(
      id: map['id'],
      name: map['name'],
      image: map['image'] ?? '',
      hits: map['favorites'],
    );
  }

  @override
  List<Object> get props => [
    id,
    name,
    image,
    hits,
  ];
}
