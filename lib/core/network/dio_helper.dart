import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_helper.dart';

class DioHelper implements ApiHelper {
  final Dio dio;

  DioHelper({
    required this.dio,
  });

  @override
  Future<T> get<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  }) async {
    return await _tryAndCatchBlock<T>(
      responseBuilder: () async => await dio.get(
        endPoint,
        queryParameters: queries,
        data: body,
      ),
    );
  }

  @override
  Future<T> post<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  }) async {
    return _tryAndCatchBlock<T>(
      responseBuilder: () async => await dio.post(
        endPoint,
        queryParameters: queries,
        data: body,
      ),
    );
  }

  @override
  Future<T> put<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  }) async {
    return _tryAndCatchBlock<T>(
      responseBuilder: () async => await dio.put(
        endPoint,
        queryParameters: queries,
        data: body,
      ),
    );
  }

  @override
  Future<T> patch<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  }) async {
    return _tryAndCatchBlock<T>(
      responseBuilder: () async => await dio.patch(
        endPoint,
        queryParameters: queries,
        data: body,
      ),
    );
  }

  @override
  Future<T> delete<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  }) async {
    return _tryAndCatchBlock<T>(
      responseBuilder: () async => await dio.delete(
        endPoint,
        queryParameters: queries,
        data: body,
      ),
    );
  }

  Future<T> _tryAndCatchBlock<T>({
    required Future<Response> Function() responseBuilder,
  }) async {
    dio.options.baseUrl = ApiK.baseUrl;
    Response response = await responseBuilder();

    log("✅✅✅✅✅✅✅✅ Response Success ✅✅✅✅✅✅✅✅");
    log(response.data.toString());

    return response.data as T;
  }
}
