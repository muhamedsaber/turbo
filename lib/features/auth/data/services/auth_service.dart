import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:turbo/core/networking/api_constants.dart';
import 'package:turbo/features/auth/data/models/login_request_body.dart';
import 'package:turbo/features/auth/data/models/login_response.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST("auth/login")
  Future<LoginResponse> login({@Body() required LoginRequestBody body});
  
}
