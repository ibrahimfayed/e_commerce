import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/features/categories/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorManager
            .productColor, //color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: CachedNetworkImage(
              fit: .scaleDown,
              width: MediaQuery.sizeOf(context).height *0.4,
              height: MediaQuery.sizeOf(context).height *0.15,
              imageUrl:
                  category.coverPictureUrl ??
                  'https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.image_not_supported_outlined, size: 50),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            category.name,
            style: getBoldStyle(
              color: ColorManager.backgroundDark,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
