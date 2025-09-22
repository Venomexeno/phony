import '../enums/top_devices_enum.dart';
import 'top_device_item.dart';
import 'top_devices.dart';

class TopDevicesByFans extends TopDevices {

  const TopDevicesByFans({
    required super.topDevicesEnum,
    required super.topDeviceItems,
  });

  factory TopDevicesByFans.fromMap(Map<String, dynamic> map) {
    return TopDevicesByFans(
      topDevicesEnum: TopDevicesEnum.fans,
      topDeviceItems: (map['list'] as List).map((device) => TopDeviceItem.fromMap(device)).toList(),
    );
  }
}
