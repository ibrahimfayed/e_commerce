import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/domain/repositories/auh_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository _repository;

  const Login(this._repository);

  Future<Either<Failure, void>> call(LoginRequest request) =>
      _repository.login(request);
}
