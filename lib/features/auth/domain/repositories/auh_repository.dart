import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
abstract class AuthRepository {
  Future<Either<Failure, void>> register(RegisterRequest request);

  Future<Either<Failure, void>> login(LoginRequest request);

  Future<Either<Failure, void>> verifyEmail({required String code, required String email});

  Future<Either<Failure, void>> resendOtp({required String email});

  Future<Either<Failure, void>> forgotPassword({required String email});

  Future<Either<Failure, void>> validateOtp({required String email, required String code});

  Future<Either<Failure, void>> resetPassword({required String email, required String code, required String newPassword});
}
