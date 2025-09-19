import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'environment_type.dart';

abstract class AppConfiguration {
  static late EnviromentType _enviromentType;

  static Future<void> init({
    required EnviromentType enviromentType,
  }) async {
    _enviromentType = enviromentType;
    await dotenv.load(fileName: enviromentType.configurationFilePath);
  }

  static EnviromentType get enviromentType => _enviromentType;

  static bool get isDevelopment => _enviromentType == EnviromentType.development;

  static bool get isProduction => _enviromentType == EnviromentType.production;

  static Map<String, dynamic> get _loadedFile => dotenv.env;

  static String get baseUrl => _loadedFile['baseUrl'] ?? '';
}
