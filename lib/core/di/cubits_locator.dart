part of 'service_locator.dart';

void _initCubits() {
  sl.registerFactory<AppThemeCubit>(() => AppThemeCubit());

  sl.registerFactory<FavoritesCubit>(() => FavoritesCubit());

  sl.registerFactory<GetHotDealsCubit>(() => GetHotDealsCubit(sl<HomeRepo>()));

  sl.registerFactory<GetTopDevicesCubit>(() => GetTopDevicesCubit(sl<HomeRepo>()));

  sl.registerLazySingleton<GetBrandsCubit>(() => GetBrandsCubit(sl<HomeRepo>())); // هنا عملتها lazy singleton عشان ال brands مش هتتغير كتير ف مفيش داعي اعملها factory وكل مرة تتعمل instance جديد

  sl.registerFactory<SearchDeviceCubit>(() => SearchDeviceCubit(sl<SearchRepo>()));

  sl.registerFactory<GetBrandDevicesCubit>(() => GetBrandDevicesCubit(sl<BrandDevicesRepo>()));

  sl.registerFactory<GetDeviceDetailsCubit>(() => GetDeviceDetailsCubit(sl<DeviceDetailsRepo>()));

  sl.registerFactory<CompareDevicesCubit>(() => CompareDevicesCubit(sl<CompareRepo>()));
}
