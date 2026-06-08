import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:e_commerce/features/categories/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final Dio _dio;
  const CategoriesRemoteDataSourceImpl(this._dio);
  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndpoint);

      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed To Get Categories');
    }
  }
}
