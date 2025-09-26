part of 'service_locator.dart';

void _initDataSources() {
  sl.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<BrandDevicesRemoteDataSource>(() => BrandDevicesRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<DeviceDetailsRemoteDataSource>(() => DeviceDetailsRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<CompareRemoteDataSource>(() => CompareRemoteDataSourceImpl(sl<ApiHelper>()));
}
