import '../enums/top_devices_enum.dart';
import 'top_device_item.dart';
import 'top_devices.dart';

class TopDevicesByInterest extends TopDevices {
  const TopDevicesByInterest({
    required super.topDevicesEnum,
    required super.topDeviceItems,
  });

  factory TopDevicesByInterest.fromMap(Map<String, dynamic> map) {
    return TopDevicesByInterest(
      topDevicesEnum: TopDevicesEnum.dailyInterest,
      topDeviceItems: (map['list'] as List).map((device) => TopDeviceItem.fromMap(device)).toList(),
    );
  }

  @override
  TopDevicesByInterest copyWith({
    TopDevicesEnum? topDevicesEnum,
    List<TopDeviceItem>? topDeviceItems,
  }) {
    return TopDevicesByInterest(
      topDevicesEnum: topDevicesEnum ?? this.topDevicesEnum,
      topDeviceItems: topDeviceItems ?? this.topDeviceItems,
    );
  }
}
