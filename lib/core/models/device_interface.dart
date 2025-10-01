import 'package:equatable/equatable.dart';

import 'detailed_device.dart';

abstract class DeviceInterface extends Equatable {
  // هنا عملت انترفيس بيجمع الحاجات المشتركة ف كل الموبايلات
  final String id;
  final String name;
  final String image;

  const DeviceInterface({
    required this.id,
    required this.name,
    required this.image,
  });

  bool get isDetailedDevice => this is DetailedDevice;
  DetailedDevice get asDetailedDevice => this as DetailedDevice;
/// هنا عملت ميثود تحول ل map
/// وطبعا لو عايز اغيرها هخلي الكلاس اللي بيورث منه بيعمل override زي في ال detailed device class
  Map<String, dynamic> get toMap => { 
    'id': id,
    'name': name,
    'image': image,
  };

  @override
  List<Object> get props => [
    id,
    name,
    image,
  ];
}
