import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:turbo/core/networking/dio_factory.dart';
import 'package:turbo/features/auth/data/repos/auth_repo.dart';
import 'package:turbo/features/auth/data/services/auth_service.dart';

final getIt = GetIt.instance;

setupDependencies() {
  _setupAuth();
}

_setupAuth() {
  getIt.registerSingleton<Dio>(DioFactory().dio);
  getIt.registerSingleton<AuthService>(AuthService(getIt()));
  getIt.registerSingleton<AuthRepo>(AuthRepo(service: getIt()));
}
