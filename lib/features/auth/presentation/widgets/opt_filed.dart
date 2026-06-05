import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class OptFiled extends StatelessWidget {
  const OptFiled({super.key,this.size, required this.controller});

  final double? size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final boxSize = size ?? MediaQuery.of(context).size.width * .2;
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        controller: controller,
        style: getBoldStyle(color: ColorManager.black, fontSize: size == null ? 24 : 16),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: ColorManager.backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.border, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.secColor, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}