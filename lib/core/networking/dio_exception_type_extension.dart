
import 'package:dio/dio.dart';
import 'package:turbo/core/networking/api_error_model.dart';

extension DioExceptionTypeExtension on DioException {
  ApiErrorModel when({
    required ApiErrorModel Function() connectionError,
    required ApiErrorModel Function() connectionTimeout,
    required ApiErrorModel Function() sendTimeout,
    required ApiErrorModel Function() receiveTimeout,
    required ApiErrorModel Function() badCertificate,
    required ApiErrorModel Function() badResponse,
    required ApiErrorModel Function() cancel,
    required ApiErrorModel Function() unknown,
  }) {
    if (type == DioExceptionType.connectionError) {
      return connectionError();
    } else if (type == DioExceptionType.connectionTimeout) {
      return connectionTimeout();
    } else if (type == DioExceptionType.sendTimeout) {
      return sendTimeout();
    } else if (type == DioExceptionType.receiveTimeout) {
      return receiveTimeout();
    } else if (type == DioExceptionType.badCertificate) {
      return badCertificate();
    } else if (type == DioExceptionType.badResponse) {
      return badResponse();
    } else if (type == DioExceptionType.cancel) {
      return cancel();
    } else {
      return unknown();
    }
  }
}
