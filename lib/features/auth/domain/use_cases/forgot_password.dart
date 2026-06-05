import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgotPassword {
  final AuthRepository _repository;

  const ForgotPassword(this._repository);

  Future<Either<Failure, void>> call(String email) =>
      _repository.forgotPassword(email: email);
}
