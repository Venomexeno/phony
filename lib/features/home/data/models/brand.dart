import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String id;
  final String name;
  final int numberOfDevices;

  const Brand({
    required this.id,
    required this.name,
    required this.numberOfDevices,
  });

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map['id'],
      name: map['name'],
      numberOfDevices: map['devices'],
    );
  }

  @override
  List<Object> get props => [
    id,
    name,
    numberOfDevices,
  ];
}
