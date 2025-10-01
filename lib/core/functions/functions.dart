import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../di/service_locator.dart';
import '../error/failure.dart';
import '../helpers/network_connection_helper/network_connection_helper.dart';

// دي فانكشن بيعمل ريكويست وبيدي ريسبونس يا فشل يا نجح بناءا عالنوع اللي بديهوله
Future<Either<Failure, T>> tryAndCatchBlock<T>({
  bool withInternetConnectionCheck = true,
  String? failureMessage,
  required Future<T> Function() functionToExecute,
}) async {
  failureMessage = "Please Try Again";

  if (withInternetConnectionCheck && !await sl<NetworkConnectionHelper>().isConnected) { // لو مفيش نت علي طول يقوله فشل بسبب النت
    return Left(Failure(message: "Check Your Network Connection"));
  }

  // لو في نت يبدأ يجرب الريكويست

  try {
    return Right(await functionToExecute());
  } on DioException catch (ex) { // هنا بشوف نوع الايرور وبرجعه في ال كونسول عشان اشوفه
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
