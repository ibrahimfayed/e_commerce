import 'package:e_commerce/features/categories/data/models/category_model.dart';

class CategoriesResponse {
  final List<CategoryModel> categories;

  const CategoriesResponse({required this.categories});
  // factory CategoriesResponse.fromJson(List<dynamic> json) {
  //   return CategoriesResponse(
  //     categories: json
  //         .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
