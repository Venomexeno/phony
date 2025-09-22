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

  TopDeviceItem _copyWith({
    String? id,
    String? name,
    String? image,
    int? hits,
  }) {
    return TopDeviceItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      hits: hits ?? this.hits,
    );
  }

  TopDeviceItem updateImage({String? image}) {
    return _copyWith(image: image);
  }

  @override
  List<Object> get props => [
    id,
    name,
    image,
    hits,
  ];
}
