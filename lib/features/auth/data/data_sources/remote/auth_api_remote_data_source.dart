import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/errors/error_helper.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio;

  AuthApiRemoteDataSource(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndpoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to login');
    }
  }

  @override
  Future<void> register(RegisterRequest request) async {
    try {
      await _dio.post(APIConstants.registerEndpoint, data: request.toJson());
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to register');
    }
  }

  @override
  Future<void> verifyEmail({
    required String code,
    required String email,
  }) async {
    try {
      await _dio.post(
        APIConstants.verifyEmailEndpoint,
        data: {'otp': code, 'email': email},
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to verify email');
    }
  }

  @override
  Future<void> resendOtp({required String email}) async {
    try {
      await _dio.post(APIConstants.resendOtpEndpoint, data: {'email': email});
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to resend OTP');
    }
  }
}
