import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../features/favorites/controller/favorites_cubit/favorites_cubit.dart';
import '../helpers/network_connection_helper/internet_connection_checker_helper.dart';
import '../helpers/network_connection_helper/network_connection_helper.dart';

part 'cubits_locator.dart';
part 'data_sources_locator.dart';
part 'helpers_locator.dart';
part 'repos_locator.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    _initAppHelpers();
    _initDataSources();
    _initRepos();
    _initCubits();
  }
}
