import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyEmail {
  final AuthRepository _repository;

  const VerifyEmail(this._repository);

  Future<Either<Failure, void>> call(String code, String email) =>
      _repository.verifyEmail(code: code, email: email);
}
