part of 'service_locator.dart';

void _initAppHelpers() {
  
  sl.registerLazySingleton<NetworkConnectionHelper>(
    () => InternetConnectionCheckerHelper(
      checker: InternetConnectionChecker.instance
    )
  );
}
