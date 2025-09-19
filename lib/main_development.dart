import 'dart:async';

import 'package:flutter/material.dart';

import 'app/environment_type.dart';
import 'app/phony_app.dart';

void main(List<String> args) {
  runZonedGuarded(
    () => runApp(const PhonyApp(enviromentType: EnviromentType.development)),
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
