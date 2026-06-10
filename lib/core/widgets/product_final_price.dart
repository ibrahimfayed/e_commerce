import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:flutter/widgets.dart';
class ProductFinalPrice extends StatelessWidget {
  const ProductFinalPrice({
    super.key,
    required this.fontSize,
    required this.color
  });
final double fontSize;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      '5000.0 EGP',
      style: getBoldStyle(color: color,  fontSize: fontSize),
    );
  }
}