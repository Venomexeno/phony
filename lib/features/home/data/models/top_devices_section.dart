import 'package:equatable/equatable.dart';

import '../enums/top_devices_enum.dart';
import 'top_device_item.dart';
import 'top_devices_by_fans.dart';
import 'top_devices_by_interest.dart';

abstract class TopDevicesSection extends Equatable {
  final TopDevicesEnum topDevicesEnum;
  final List<TopDeviceItem> topDeviceItems;

  const TopDevicesSection({
    required this.topDevicesEnum,
    required this.topDeviceItems,
  });

  bool get isTopDevicesByFans => this is TopDevicesByFans;
  bool get isTopDevicesByInterest => this is TopDevicesByInterest;

  TopDevicesByFans get asTopDevicesByFans => this as TopDevicesByFans;
  TopDevicesByInterest get asTopDevicesByInterest => this as TopDevicesByInterest;

  factory TopDevicesSection.fromMap(Map<String, dynamic> map) {
    return TopDevicesEnum.convertTitleToEnum(map['category']).fromMap(map);
  }

  TopDevicesSection copyWith({
    TopDevicesEnum? topDevicesEnum,
    List<TopDeviceItem>? topDeviceItems,
  });

  @override
  List<Object> get props => [
    topDevicesEnum,
    topDeviceItems,
  ];
}
