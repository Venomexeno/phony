import '../../../app/app_configuration.dart';

abstract class ApiK {
  static final String baseUrl = AppConfiguration.baseUrl;
  static final String deals = 'deals';
  static final String topDevices = 'top';
  static final String deviceDetails = 'catalog/devices';
  static final String brands = 'catalog/brands';
  static final String search = 'search';
}
