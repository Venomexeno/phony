import 'package:equatable/equatable.dart';

class Deal extends Equatable {
  final String memory;
  final String storeImg;
  final num price;
  final String currency;
  final num discount;

  const Deal({
    required this.memory,
    required this.storeImg,
    required this.price,
    required this.currency,
    required this.discount,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      memory: json['memory'],
      storeImg: json['storeImg'],
      price: json['price'],
      currency: json['currency'],
      discount: json['discount'],
    );
  }

  @override
  List<Object> get props => [
    memory,
    storeImg,
    price,
    currency,
    discount,
  ];
}
