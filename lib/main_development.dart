import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/environment_type.dart';
import 'app/phony_app.dart';
import 'core/di/service_locator.dart';

void main(List<String> args) {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
      );
      ServiceLocator.init();
      runApp(const PhonyApp(enviromentType: EnviromentType.development));
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
