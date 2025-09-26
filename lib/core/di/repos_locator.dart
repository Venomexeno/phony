part of 'service_locator.dart';

void _initRepos() {
  sl.registerFactory<HomeRepo>(() => HomeRepoImpl(sl<HomeRemoteDataSource>()));

  sl.registerFactory<SearchRepo>(() => SearchRepoImpl(sl<SearchRemoteDataSource>()));

  sl.registerFactory<BrandDevicesRepo>(() => BrandDevicesRepoImpl(sl<BrandDevicesRemoteDataSource>()));

  sl.registerFactory<DeviceDetailsRepo>(() => DeviceDetailsRepoImpl(sl<DeviceDetailsRemoteDataSource>()));

  sl.registerFactory<CompareRepo>(() => CompareRepoImpl(sl<CompareRemoteDataSource>()));
}
