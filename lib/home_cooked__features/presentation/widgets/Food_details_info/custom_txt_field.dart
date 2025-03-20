import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

Widget customTxtField(double height, double width, String hintText, TextEditingController txtController, bool hasCounter,int maxLines,String suffixtext) {
  return SizedBox(
    width: width.w,
    height: height.h, 
    child: TextField(
      style: TextStyles.fontCircularSpotify12BlackRegular,
      controller: txtController,
      maxLines: maxLines,
      decoration: InputDecoration(
        counterText: hasCounter ? '200' : null, 
        counterStyle: TextStyles.fontCircularSpotify8GreenRegular,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppPallete.whiteGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppPallete.whiteGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppPallete.lgGreyColor, width: 2),
        ),
        suffixText: suffixtext,
        hintText: hintText,
        hintStyle: TextStyles.fontCircularSpotify12GrayRegular,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h), 
      ),
    ),
  );
}
