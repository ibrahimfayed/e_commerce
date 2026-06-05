import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
