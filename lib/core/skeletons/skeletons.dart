import '../../features/home/data/models/deal.dart';
import '../../features/home/data/models/hot_deal_device.dart';

List<HotDealDevice> getSkeletonData() {
  return List.generate(
    3,
    (index) => HotDealDevice(
      id: 'skeleton_$index',
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
