import 'device.dart';
import 'device_quick_spec.dart';

class DetailedDevice extends Device {
  final List<DeviceQuickSpec> quickSpecs;

  const DetailedDevice({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
    required this.quickSpecs,
  });
}
