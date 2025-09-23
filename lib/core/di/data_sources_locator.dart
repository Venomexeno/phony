part of 'service_locator.dart';

void _initDataSources() {
  sl.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl<ApiHelper>()));

  sl.registerFactory<BrandDevicesRemoteDataSource>(() => BrandDevicesRemoteDataSourceImpl(sl<ApiHelper>()));
}
