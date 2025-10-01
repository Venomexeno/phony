part of 'service_locator.dart';

void _initDataSources() {
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerLazySingleton<BrandDevicesRemoteDataSource>(() => BrandDevicesRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerLazySingleton<DeviceDetailsRemoteDataSource>(() => DeviceDetailsRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerLazySingleton<CompareRemoteDataSource>(() => CompareRemoteDataSourceImpl(sl<ApiHelper>()));
}
