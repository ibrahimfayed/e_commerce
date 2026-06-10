import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ClipRRect(
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.elliptical(180.r, 40.r),
          bottomRight: Radius.elliptical(180.r, 40.r),
        ),
        child: CachedNetworkImage(
          imageUrl:
              'https://t3.ftcdn.net/jpg/01/70/71/34/360_F_170713428_KgRrmdjyiRauJGAXJwVSqKlDXEO2YU8i.jpg',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          errorListener: (value) {
            return;
          },
    
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ),
          ),
          errorWidget: (context, url, error) {
            return Image.network(
              'https://t3.ftcdn.net/jpg/01/70/71/34/360_F_170713428_KgRrmdjyiRauJGAXJwVSqKlDXEO2YU8i.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>  Center(
                child: Icon(Icons.image_not_supported_outlined, size: 50.sp),
              ),
            );
          },
        ),
      ),
    );
  }
}