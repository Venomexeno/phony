part of 'service_locator.dart';

void _initCubits() {
  sl.registerFactory<AppThemeCubit>(() => AppThemeCubit());

  sl.registerFactory<FavoritesCubit>(() => FavoritesCubit());

  sl.registerFactory<GetHotDealsCubit>(() => GetHotDealsCubit(sl<HomeRepo>()));
}
