import 'package:equatable/equatable.dart';

class CompareSpecRow extends Equatable {
  final String title;
  final String firstValue;
  final String secondValue;

  const CompareSpecRow({
    required this.title,
    required this.firstValue,
    required this.secondValue,
  });

  @override
  List<Object> get props => [
    title,
    firstValue,
    secondValue,
  ];
}
