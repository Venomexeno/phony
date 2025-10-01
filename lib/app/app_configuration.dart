import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'environment_type.dart';

abstract class AppConfiguration {
  static Future<void> init({
    /// هنا بجيب ال enviromentType من الماين
    required EnviromentType enviromentType, 
  }) async {
    /// هنا بحمل الداتا من ملف ال env المناسب اذا كان dev او production
    await dotenv.load(fileName: enviromentType.configurationFilePath);
  }

  static Map<String, dynamic> get _loadedFile => dotenv.env;

  static String get baseUrl => _loadedFile['baseUrl'] ?? ''; // هنا بجيب ال baseUrl من ملف ال env سواء كان dev او production
}
