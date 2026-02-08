import 'package:dio/dio.dart';

class Failure {
  static String getMessage(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "⏳ Connection timeout. Please check your internet.";
        case DioExceptionType.sendTimeout:
          return "⚠️ Send timeout. Try again.";
        case DioExceptionType.receiveTimeout:
          return "📡 Server is taking too long to respond.";
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return "🚫 Request was cancelled.";
        case DioExceptionType.unknown:
          if (error.message != null && error.message!.contains("SocketException")) {
            return "❌ No Internet connection.";
          }
          return "⚠️ Unknown network error occurred.";
        default:
          return "❗ Something went wrong.";
      }
    } else {
      return "Unexpected error: ${error.toString()}";
    }
  }

  static String _handleBadResponse(Response? response) {
    final status = response?.statusCode;
    final data = response?.data;

    switch (status) {
      case 400:
        return data?['message'] ?? "Bad request.";
      case 401:
        return "Unauthorized. Please log in again.";
      case 403:
        return "Forbidden. Access denied.";
      case 404:
        return "Resource not found.";
      case 422:
        return data?['message'] ?? "Validation error.";
      case 500:
        return "Internal server error.";
      default:
        return data?['message'] ?? "Unknown error (code $status)";
    }
  }
}
