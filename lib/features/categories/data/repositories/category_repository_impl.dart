import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:e_commerce/features/categories/data/models/category_model.dart';
import 'package:e_commerce/features/categories/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoriesRemoteDataSource _remoteDataSource;
  CategoryRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _remoteDataSource.getCategories();
      final categories = response.categories;

      return Right(categories);
    } catch (exception) {
      if (exception is RemoteException) {
        return Left(Failure(message: exception.message));
      }
      return Left(Failure(message: exception.toString()));
    }
  }
}
// catch (exception) {
//       return Left(Failure(message: exception.toString())); //exception.message
//     }