import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResendOtp {
  final AuthRepository _repository;

  const ResendOtp(this._repository);

  Future<Either<Failure, void>> call(String email) =>
      _repository.resendOtp(email: email);
}
