

import 'package:turbo/core/networking/api_error_handler.dart';
import 'package:turbo/core/networking/api_error_model.dart';

class ApiResult<T> {
  ApiResult._();
  factory ApiResult.success(T data) = ApiSuccess<T>;
  factory ApiResult.error(Object e) = ApiError<T>;
  when(
      {required Function(T data) onSuccess,
      required Function(ApiErrorModel error) onError}) {
    if (this is ApiSuccess<T>) {
      return onSuccess((this as ApiSuccess<T>).data);
    } else {
      return onError(ApiErrorHandler.handle((this as ApiError).error));
    }
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data) : super._();
}

class ApiError<T> extends ApiResult<T> {
  final Object error;

  ApiError(this.error) : super._();
}
