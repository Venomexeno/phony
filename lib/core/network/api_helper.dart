abstract class ApiHelper {
  Future<T> get<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  });

  Future<T> post<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  });

  Future<T> put<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  });

  Future<T> patch<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  });

  Future<T> delete<T>({
    required String endPoint,
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    dynamic body,
    String? contentType,
  });
}
