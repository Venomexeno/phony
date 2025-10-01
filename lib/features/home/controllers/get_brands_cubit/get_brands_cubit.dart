import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/brand.dart';
import '../../data/repo/home_repo.dart';

part 'get_brands_state.dart';

class GetBrandsCubit extends CustomCubit<GetBrandsState> {
  GetBrandsCubit(this._homeRepo) : super(GetBrandsInitial());

  final HomeRepo _homeRepo;

   final List<Brand> _brands = [];

  Future<void> getBrands() async {
    if (state is GetBrandsSuccess) return; // لو ال state الحالية هي GetBrandsSuccess بعمل return عشان متعملش request تاني

    emit(GetBrandsLoading());

    final brandsOrFailure = await _homeRepo.getBrands();
    brandsOrFailure.fold(
      _failure,
      _success,
    );
  }

  void _failure(Failure failure) => emit(
    GetBrandsFailure(
      message: failure.message,
    ),
  );

  void _success(List<Brand> brands) {
    _brands.clear();
    _brands.addAll(brands);
    emit(GetBrandsSuccess(brands: _brands));
  }

  void searchForBrand(String query) {
    final filteredBrands = _brands
        .where((brand) => brand.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetBrandsSuccess(brands: filteredBrands));
  }
}
