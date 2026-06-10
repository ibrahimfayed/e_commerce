import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce/core/widgets/product_details_image.dart';
import 'package:e_commerce/core/widgets/product_final_price.dart';
import 'package:e_commerce/core/widgets/product_original_price.dart';
import 'package:e_commerce/core/widgets/product_rating.dart';
import 'package:e_commerce/core/widgets/product_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDatailsScreen extends StatelessWidget {
  const ProductDatailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.backgroundDark,
          ),
        ),
      ),
      body: Column(
        children: [
          ProductDetailsImage(),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                ProductTitleText(fontSize: 26.sp),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ProductFinalPrice(
                      fontSize: 23.sp,
                      color: ColorManager.secColor,
                    ),
                    SizedBox(width: 8.w),
                    ProductPriceBeforeDiscount(fontSize: 19.sp),
                    Spacer(),
                    Text(
                      'Weight: 0.1 gm',
                      style: getBoldStyle(
                        color: ColorManager.secColor,
                        fontSize: 19.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    ProductRating(
                      fontSizeRating: 18.sp,
                      fontSizeReviews: 17.sp,
                      starRatingSize: 18.sp,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.review);
                      },
                      child: Text(
                        'Review',
                        style: getBoldStyle(
                          color: ColorManager.lightPrimaryColor,
                          fontSize: 16.sp,
                        ).copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Waterproof fitness tracker with heart rate monitor',
                  style: getRegularStyle(
                    color: ColorManager.greyColor,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 150.h),

                CustomElevatedButton(
                  prefixIcon: Icon(
                    Icons.add_shopping_cart,
                    color: ColorManager.white,
                    size: 22.0.sp,
                  ),
                  label: 'Add To Cart',
                  onTap: () {},
                  backgroundColor: ColorManager.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
