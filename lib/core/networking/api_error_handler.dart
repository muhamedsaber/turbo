import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turbo/core/networking/api_error_factory.dart';
import 'package:turbo/core/networking/api_error_model.dart';
import 'package:turbo/core/networking/dio_exception_type_extension.dart';
import 'package:turbo/core/networking/local_status_codes.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        return e.when(
          connectionError: () => ApiErrorModel(
            message:
                "No internet connection. Please check your Wi-Fi or mobile data.",
            errors: [],
            icon: Icons.wifi_off,
            statusCode: LocalStatusCodes.connectionError,
          ),
          connectionTimeout: () => ApiErrorModel(
            message:
                "The connection took too long. Try checking your internet or try again later.",
            icon: Icons.timer_off,
            statusCode: LocalStatusCodes.connectionTimeout,
            errors: [],
          ),
          sendTimeout: () => ApiErrorModel(
            message: "Request timed out while sending data. Please try again.",
            icon: Icons.send,
            statusCode: LocalStatusCodes.sendTimeout,
            errors: [],
          ),
          receiveTimeout: () => ApiErrorModel(
            message: "Server took too long to respond. Please try again later.",
            icon: Icons.downloading,
            statusCode: LocalStatusCodes.receiveTimeout,
            errors: [],
          ),
          badCertificate: () => ApiErrorModel(
            message:
                "Security issue detected with the server. Connection not secure.",
            icon: Icons.security,
            statusCode: LocalStatusCodes.badCertificate,
            errors: [],
          ),
          badResponse: () {
            final allErrors = e.response?.data["errors"] as Map<String, dynamic>?;
            final errorsList = <String>[];
            if (allErrors != null) {
              allErrors.forEach((key, value) {
                for (var e in (value as List)) {
                  final String singleErrMessage = "$key: $e";
                  errorsList.add(singleErrMessage);
                }
              });
            }
            return ApiErrorModel(
              statusCode: e.response?.statusCode,
              message: e.response?.data["message"],
              errors: errorsList,
              icon: Icons.error,
            );
          },
          cancel: () => ApiErrorModel(
            message: "The request was cancelled. Please try again.",
            icon: Icons.cancel,
            statusCode: LocalStatusCodes.cancel,
            errors: [],
          ),
          unknown: () => ApiErrorModel(
            message:
                "Something went wrong. Please check your connection and try again.",
            icon: Icons.error_outline,
            statusCode: LocalStatusCodes.unknown,
            errors: [],
          ),
        );
      } 
    }
    return ApiErrorFactory.defaultError;
  }
}
