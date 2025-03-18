import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomScoialTextFormField extends StatelessWidget {
  final String hintText;
  final String prefixText;
  final String imagePath;
  final TextEditingController controller;

  const CustomScoialTextFormField({
    super.key,
    required this.hintText,
    required this.prefixText,
    required this.imagePath,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.fontInter12GreyMedium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppPallete.redColor.withOpacity(.5),
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.redColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.tooLightGray,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppPallete.tooLightGray,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        hintText: hintText,
        
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 12.h),
        fillColor: AppPallete.whiteColor,
        filled: true,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
              color: AppPallete.ofWhiteColor,
              border: Border.all(
                color: AppPallete.tooLightGray,
                width: 1.2,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                imagePath,
                width: 12,
                height: 12,
              ),
              SizedBox(width: 8.w),
              Text(
                prefixText,
                style: TextStyles.fontInter12GreyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
