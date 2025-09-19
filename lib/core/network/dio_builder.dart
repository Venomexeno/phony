import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'api_constants.dart';

class DioBuilder extends Equatable{

  late final Dio dio;

  DioBuilder() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiK.baseUrl,
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
      ),
    );
  }

  @override
  List<Object?> get props => [dio];
}