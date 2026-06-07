import 'package:e_commerce/features/categories/data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoriesLoading extends CategoryState {}
class GetCategoriesSuccess extends CategoryState {
  final List<CategoryModel> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends CategoryState {
  final String message;
  GetCategoriesError(this.message);
}
