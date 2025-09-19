import '../../../../core/models/device.dart';
import 'deal.dart';

class HotDealDevice extends Device {
  final Deal deal;
  final String url;

  const HotDealDevice({
    required super.id,
    required super.name,
    required super.image,
    required super.description,
    required this.deal,
    required this.url,
  });

  String get originalPrice => (deal.price + (deal.price * deal.discount / 100)).toStringAsFixed(2);

  factory HotDealDevice.fromJson(Map<String, dynamic> json) {
    return HotDealDevice(
      id: json['id'],
      name: json['name'],
      image: json['img'],
      url: json['url'],
      description: json['description'],
      deal: Deal.fromJson(json['deal']),
    );
  }

  @override
  List<Object> get props => [
    ...super.props,
    deal,
    url,
  ];
}
