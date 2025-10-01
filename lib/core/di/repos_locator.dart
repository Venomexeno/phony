part of 'service_locator.dart';

void _initRepos() {
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl<HomeRemoteDataSource>()));

  sl.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(sl<SearchRemoteDataSource>()));

  sl.registerLazySingleton<BrandDevicesRepo>(() => BrandDevicesRepoImpl(sl<BrandDevicesRemoteDataSource>()));

  sl.registerLazySingleton<DeviceDetailsRepo>(() => DeviceDetailsRepoImpl(sl<DeviceDetailsRemoteDataSource>()));

  sl.registerLazySingleton<CompareRepo>(() => CompareRepoImpl(sl<CompareRemoteDataSource>()));
}
