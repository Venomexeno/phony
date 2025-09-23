import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app_configuration.dart';
import 'app/environment_type.dart';
import 'app/phony_app.dart';
import 'core/di/service_locator.dart';

void main(List<String> args) {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await AppConfiguration.init(enviromentType: EnviromentType.production);
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
      );
      ServiceLocator.init();
      runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => const PhonyApp(),
        ),
      );
    },
    (error, stackTrace) {
      FlutterError.dumpErrorToConsole(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
        ),
      );
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
        ),
      );
    },
  );
}
