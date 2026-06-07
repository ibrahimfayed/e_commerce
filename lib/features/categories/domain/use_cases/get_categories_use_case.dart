import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories/data/models/category_model.dart';
import 'package:e_commerce/features/categories/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUseCase {
  final CategoryRepository _repository;
  GetCategoriesUseCase(this._repository);
  Future<Either<Failure, List<CategoryModel>>> call() =>
      _repository.getCategories();
}
