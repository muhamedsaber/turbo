import 'package:turbo/config/cache/cache_constants.dart';
import 'package:turbo/config/cache/cache_helper.dart';
import 'package:turbo/core/networking/api_result.dart';
import 'package:turbo/features/auth/data/models/login_request_body.dart';
import 'package:turbo/features/auth/data/services/auth_service.dart';
import '../models/login_response.dart';

class AuthRepo {
  final AuthService service;

  AuthRepo({required this.service});

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await service.login(body: body);
      await CacheHelper.setSecureData(
        key: CacheConstants.accessToken,
        value: response.accessToken,
      );
      await CacheHelper.setSecureData(
        key: CacheConstants.refreshToken,
        value: response.refreshToken,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
