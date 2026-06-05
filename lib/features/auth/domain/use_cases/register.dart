import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Register {
  final AuthRepository _repository;

  const Register(this._repository);

  Future<Either<Failure, void>> call(RegisterRequest request) =>
      _repository.register(request);
}
