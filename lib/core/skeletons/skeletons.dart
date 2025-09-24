import '../../features/home/data/models/brand.dart';
import '../../features/home/data/models/deal.dart';
import '../../features/home/data/models/hot_deal_device.dart';
import '../../features/home/data/models/top_device_item.dart';
import '../models/detailed_device.dart';
import '../models/device.dart';
import '../models/device_detailed_spec.dart';
import '../models/device_quick_spec.dart';

List<HotDealDevice> hotDealsSkeletonData() {
  return List.generate(
    3,
    (index) => HotDealDevice(
      id: '',
      name: 'Apple...',
      description: 'Apple iPhone 15 Pro Max...',
      image: '',
      deal: const Deal(
        memory: '128GB',
        storeImg: '',
        price: 1000.0,
        currency: '\$',
        discount: 10.0,
      ),
      url: '',
    ),
  );
}

List<TopDeviceItem> topDevicesSkeletonData() {
  return List.generate(
    10,
    (index) => TopDeviceItem(
      id: '',
      name: 'Apple...',
      image: '',
      hits: 12341,
    ),
  );
}

List<Brand> brandsSkeletonData() {
  return List.generate(
    10,
    (index) => Brand(
      id: '',
      name: 'Apple...',
      numberOfDevices: 12341,
    ),
  );
}

List<Device> searchDevicesSkeletonData() {
  return List.generate(
    10,
    (index) => Device(
      id: '',
      name: 'Apple...',
      image: '',
      description: 'This is a description With Long Text And Many Words Try To Fit In This Description And Many Words',
    ),
  );
}

DetailedDevice deviceDetailsSkeletonData() {
  return DetailedDevice(
    id: '',
    name: 'Apple...',
    image: '',
    quickSpecs: List.generate(
      3,
      (index) => DeviceQuickSpec(
        title: 'Category',
        value: 'Value',
      ),
    ),
    detailedSpecs: List.generate(
      3,
      (index) => DeviceDetailedSpec(
        category: 'Category',
        specifications: List.generate(
          3,
          (index) => DeviceQuickSpec(
            title: 'Category',
            value: 'Value',
          ),
        ),
      ),
    ),
  );
}
