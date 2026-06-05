abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  final String message;

  RegisterError(this.message);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);
}

class VerifyEmailLoading extends AuthState {}

class VerifyEmailSuccess extends AuthState {}

class VerifyEmailError extends AuthState {
  final String message;

  VerifyEmailError(this.message);
}

class ResendOtpLoading extends AuthState {}

class ResendOtpSuccess extends AuthState {}

class ResendOtpError extends AuthState {
  final String message;

  ResendOtpError(this.message);
}
