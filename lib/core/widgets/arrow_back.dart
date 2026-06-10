import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      icon: Container(
        margin: EdgeInsets.only(left: 16.w),
        padding: EdgeInsets.all(4.sp),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: SvgPicture.asset('assets/icons/arrow_left.svg'),//,height: 24,width: 24,fit: .scaleDown,
      ),
    );
  }
}