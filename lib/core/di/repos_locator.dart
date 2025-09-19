part of 'service_locator.dart';

void _initRepos() {
  sl.registerFactory<HomeRepo>(() => HomeRepoImpl(sl<HomeRemoteDataSource>()));
}
