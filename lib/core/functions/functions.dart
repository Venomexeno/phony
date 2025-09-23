import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../di/service_locator.dart';
import '../error/failure.dart';
import '../helpers/network_connection_helper/network_connection_helper.dart';

Future<Either<Failure, T>> tryAndCatchBlock<T>({
  bool withInternetConnectionCheck = true,
  String? failureMessage,
  required Future<T> Function() functionToExecute,
}) async {
  failureMessage = "Please Try Again";

  if (withInternetConnectionCheck && !await sl<NetworkConnectionHelper>().isConnected) {
    return Left(Failure(message: "Check Your Network Connection"));
  }

  try {
    return Right(await functionToExecute());
  } on DioException catch (ex) {
    return Left(Failure.serverFailure(statusCode: ex.response?.statusCode));
  } on Exception catch (ex, st) {
    FlutterError.dumpErrorToConsole(FlutterErrorDetails(exception: ex, stack: st));
    return Left(Failure(message: failureMessage));
  } on TypeError catch (ex, st) {
    FlutterError.dumpErrorToConsole(FlutterErrorDetails(exception: ex, stack: st));
    return Left(Failure(message: failureMessage));
  }
}

void showMyModalBottomSheet({
  bool isScrollControlled = true,
  bool isDismissible = true,
  bool enableDrag = true,
  required BuildContext context,
  required WidgetBuilder builder,
  AnimationController? transitionAnimationController,
}) {
  showModalBottomSheet(
    context: context,
    transitionAnimationController: transitionAnimationController,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: builder,
  );
}
