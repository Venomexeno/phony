import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../features/favorites/controller/favorites_cubit/favorites_cubit.dart';
import '../../features/home/controllers/get_brands_cubit/get_brands_cubit.dart';
import '../../features/home/controllers/get_hot_deals_cubit/get_hot_deals_cubit.dart';
import '../../features/home/controllers/get_top_devices_cubit/get_top_devices_cubit.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../helpers/network_connection_helper/internet_connection_checker_helper.dart';
import '../helpers/network_connection_helper/network_connection_helper.dart';
import '../network/api_helper.dart';
import '../network/dio_helper.dart';

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
