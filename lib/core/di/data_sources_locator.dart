part of 'service_locator.dart';

void _initDataSources() {
  sl.registerFactory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl<ApiHelper>()));
}
