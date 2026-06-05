import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResetPassword {
  final AuthRepository _repository;

  const ResetPassword(this._repository);

  Future<Either<Failure, void>> call(String email, String code, String newPassword) =>
      _repository.resetPassword(email: email, code: code, newPassword: newPassword);
}
