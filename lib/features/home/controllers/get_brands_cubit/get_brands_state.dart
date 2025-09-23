part of 'get_brands_cubit.dart';

sealed class GetBrandsState {}

final class GetBrandsInitial extends GetBrandsState {}

final class GetBrandsLoading extends GetBrandsState {}

final class GetBrandsSuccess extends GetBrandsState {
  final List<Brand> brands;

  GetBrandsSuccess({required this.brands});
}

final class GetBrandsFailure extends GetBrandsState {
  final String message;

  GetBrandsFailure({required this.message});
}