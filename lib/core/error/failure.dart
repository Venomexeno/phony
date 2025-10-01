import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});

  factory Failure.serverFailure({required int? statusCode}) {
    // هنا كونستراكتور بياخد الريسبونس كود وبناءا عليه بيرد ب نوع المشكلة
    String message = '';
    switch (statusCode) {
      case 400:
        message = "Bad Request";
        break;
      case 401:
        message = "Unauthorized";
        break;
      case 403:
        message = "Forbidden";
        break;
      case 404:
        message = "Not Found";
        break;
      case 500:
        message = "Internal Server Error";
        break;
      default:
        message = "Server Error";
    }
    return Failure(
      message: message,
    );
  }

  @override
  List<Object> get props => [
    message,
  ];
}
