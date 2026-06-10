import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductStockIndicator extends StatelessWidget {
  const ProductStockIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      padding:  EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorManager.secColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '32 Pieces Available', //"متوفر ${product.stock} قطعة",
        textAlign: .center,
        style: getSemiBoldStyle(color: ColorManager.white),
      ),
    );
  }
}
