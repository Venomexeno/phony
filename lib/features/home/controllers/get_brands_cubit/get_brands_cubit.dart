
import '../../../../core/di/cubit/custom_cubit.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/brand.dart';
import '../../data/repo/home_repo.dart';

part 'get_brands_state.dart';

class GetBrandsCubit extends CustomCubit<GetBrandsState> {
  GetBrandsCubit(this._homeRepo) : super(GetBrandsInitial());

  final HomeRepo _homeRepo;

  Future<void> getBrands() async {

    if (state is GetBrandsSuccess) return;

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

  void _success(List<Brand> brands) => emit(
    GetBrandsSuccess(
      brands: brands,
    ),
  );
}
