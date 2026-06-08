import 'package:e_commerce/features/categories/data/models/category_model.dart';
import 'package:e_commerce/features/categories/domain/entities/category_entity.dart';

extension CategoryMapper on CategoryModel{
  CategoryEntity get toEntity => CategoryEntity(id: id, name: name,coverPictureUrl: coverPictureUrl);//it may be nullable coverPictureUrl
}