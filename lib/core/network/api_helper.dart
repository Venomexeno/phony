abstract class ApiHelper {
  /// مجرد Interface
  /// عملته عشان اطبق ال Dependency Inversion

  /// هنا انا عامل الفانكشنز كلها جينيريك طب ليه ؟
  /// عشان انا الريسبونس بتاعتي ملهوش شكل ثابت في ال باك اللي بتعامل معاه
  /// ممكن يبعتلي ليست وممكن يبعتلي ماب ف الحل اني اخليها جينيريك واقول من بره الداتا اللي هتيجي ايه
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
