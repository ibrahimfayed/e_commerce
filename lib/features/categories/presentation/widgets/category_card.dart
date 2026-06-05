import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});
  //final CategoryModel category;

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
              imageUrl:
                  'https://s.turbifycdn.com/aah/yhst-92803816272180/jbw-jb-6219-g-krypton-mens-chronograph-quartz-watch-22.jpg',
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
            'categoryName',
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
