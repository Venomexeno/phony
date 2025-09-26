import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../dependencies/app_theme_cubit/app_theme_cubit.dart';
import '../../features/brand_devices/controllers/get_brand_devices_cubit/get_brand_devices_cubit.dart';
import '../../features/brand_devices/data/data_source/brand_devices_remote_data_source.dart';
import '../../features/brand_devices/data/repo/brand_devices_repo.dart';
import '../../features/compare/controllers/compare_devices_cubit/compare_devices_cubit.dart';
import '../../features/compare/data/data_source/compare_remote_data_source.dart';
import '../../features/compare/data/repo/compare_repo.dart';
import '../../features/device_details/controllers/get_device_details_cubit/get_device_details_cubit.dart';
import '../../features/device_details/data/data_source/device_details_remote_data_source.dart';
import '../../features/device_details/data/repo/device_details_repo.dart';
import '../../features/favorites/controller/favorites_cubit/favorites_cubit.dart';
import '../../features/home/controllers/get_brands_cubit/get_brands_cubit.dart';
import '../../features/home/controllers/get_hot_deals_cubit/get_hot_deals_cubit.dart';
import '../../features/home/controllers/get_top_devices_cubit/get_top_devices_cubit.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/search/controllers/search_device_cubit/search_device_cubit.dart';
import '../../features/search/data/data_source/search_remote_data_source.dart';
import '../../features/search/data/repo/search_repo.dart';
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
