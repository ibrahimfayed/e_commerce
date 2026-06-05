import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<void> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);

  Future<void> verifyEmail({required String code, required String email});

  Future<void> resendOtp({required String email});

  Future<void> forgotPassword({required String email});

  Future<void> validateOtp({required String email, required String code});
  
  Future<void> resetPassword({required String email, required String code, required String newPassword});
}
