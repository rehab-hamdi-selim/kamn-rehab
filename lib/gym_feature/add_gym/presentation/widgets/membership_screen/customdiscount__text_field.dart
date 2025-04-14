import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomDiscountTextField extends StatelessWidget {
  const CustomDiscountTextField(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 14.w),
          child: Text(
            "%",
            style: TextStyles.fontCircularSpotify12GrayRegular,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.89.w,vertical: 0
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.75.h),
          borderSide: const BorderSide(
            width: 0.50,
            color: AppPallete.witeColorShade,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.75.h),
          borderSide: const BorderSide(
            width: 0.50,
            color: AppPallete.witeColorShade,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.75.h),
          borderSide: const BorderSide(
            width: 0.50,
            color: AppPallete.witeColorShade,
          ),
        ),
      ),
      style: TextStyles.fontCircularSpotify12BlackRegular,
    );
  }
}
