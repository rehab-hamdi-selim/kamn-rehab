import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomGymTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? helper;
  final String? optionalText;
  final TextEditingController? controller;
  final int? maxLine;
  final int? maxLength;
  

  const CustomGymTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller, this.maxLine, this.maxLength,  this.helper, this.optionalText,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: TextStyles.fontCircularSpotify14LightBlackRegular,
                    ),
                    TextSpan(
                      text: optionalText,
                      style: TextStyles.fontCircularSpotify12GrayRegular,
                    ),
                  ],
                ),
              ),
         SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
           
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
              color: AppPallete.grayColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(8.r)),
            hintText: hint,
            helperText: helper,
        
            hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 12.h),
            helperStyle: TextStyles.fontCircularSpotify10StealGrayMedium,
            fillColor: AppPallete.whiteColor,
            filled: true,
          ),
          maxLines: maxLine,
          maxLength: maxLength,
           buildCounter: maxLength != null?(context, {required currentLength, required isFocused, required maxLength}) {
                              return Text('$currentLength/($maxLength) character',style: TextStyle(
                                fontSize: 8,
                                color: currentLength==maxLength?AppPallete.redColor:AppPallete.darkGreyColor
                              ),);}:null,
        ),
      ],
    );
  }
}