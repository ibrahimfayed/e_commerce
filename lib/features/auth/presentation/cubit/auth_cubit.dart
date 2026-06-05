import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/use_cases/forgot_password.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login.dart';
import 'package:e_commerce/features/auth/domain/use_cases/register.dart';
import 'package:e_commerce/features/auth/domain/use_cases/resend_otp.dart';
import 'package:e_commerce/features/auth/domain/use_cases/reset_password.dart';
import 'package:e_commerce/features/auth/domain/use_cases/validate_otp.dart';
import 'package:e_commerce/features/auth/domain/use_cases/verify_email.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final Register _register;
  final Login _login;
  final VerifyEmail _verifyEmail;
  final ResendOtp _resendOtp;
  final ForgotPassword _forgotPassword;
  final ResetPassword _resetPassword;
  final ValidateOtp _validateOtp;

  AuthCubit(
    this._register,
    this._login,
    this._verifyEmail,
    this._resendOtp,
    this._forgotPassword,
    this._resetPassword,
    this._validateOtp,
  ) : super(AuthInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _register(request);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _login(request);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> verifyEmail(String email, String code) async {
    emit(VerifyEmailLoading());
    final result = await _verifyEmail(email, code);
    result.fold(
      (failure) => emit(VerifyEmailError(failure.message)),
      (_) => emit(VerifyEmailSuccess()),
    );
  }

  Future<void> resendOtp(String email) async {
    emit(ResendOtpLoading());
    final result = await _resendOtp(email);
    result.fold(
      (failure) => emit(ResendOtpError(failure.message)),
      (_) => emit(ResendOtpSuccess()),
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());
    final result = await _forgotPassword(email);
    result.fold(
      (failure) => emit(ForgotPasswordError(failure.message)),
      (_) => emit(ForgotPasswordSuccess()),
    );
  }

  Future<void> validateOtp(String email, String code) async {
    emit(ValidateOtpLoading());
    final result = await _validateOtp(email, code);
    result.fold(
      (failure) => emit(ValidateOtpError(failure.message)),
      (_) => emit(ValidateOtpSuccess()),
    );
  }

  Future<void> resetPassword(
    String email,
    String code,
    String newPassword,
  ) async {
    emit(ResetPasswordLoading());
    final result = await _resetPassword(email, code, newPassword);
    result.fold(
      (failure) => emit(ResetPasswordError(failure.message)),
      (_) => emit(ResetPasswordSuccess()),
    );
  }
}
