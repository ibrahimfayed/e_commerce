import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:e_commerce/core/widgets/add_to_cart_floating_button.dart';
import 'package:e_commerce/core/widgets/product_final_price.dart';
import 'package:e_commerce/core/widgets/product_original_price.dart';
import 'package:e_commerce/core/widgets/product_stock_indicator.dart';
import 'package:e_commerce/core/widgets/product_title_rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorManager
            .backgroundColor, //color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: .start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                fit: .cover,
                width: MediaQuery.sizeOf(context).width * 0.4,
                height: MediaQuery.sizeOf(context).height * 0.15,
                imageUrl:
                    'https://t3.ftcdn.net/jpg/01/70/71/34/360_F_170713428_KgRrmdjyiRauJGAXJwVSqKlDXEO2YU8i.jpg',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.image_not_supported_outlined, size: 50),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 10.w,
                child: AddToCartFloatingButton(),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ProductTitleRatingRow(),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: .start,
            children: [
              ProductPriceBeforeDiscount(fontSize: 14.sp,),
              SizedBox(width: 4.w),
              Text(
                '15 % Discount', //"خصم ${product.discountPercentage.toInt()}%",
                style: getSemiBoldStyle(
                  color: ColorManager.lightPrimaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: .start,
            children: [
              ProductFinalPrice(fontSize: 15.sp,color: ColorManager.black,),
            ],
          ),
          const Spacer(),
          ProductStockIndicator(),
        ],
      ),
    );
  }
}




