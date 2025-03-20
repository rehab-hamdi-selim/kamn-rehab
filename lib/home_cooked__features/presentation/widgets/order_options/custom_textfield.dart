import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomCookTextFormFeld extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? enabled;
  const CustomCookTextFormFeld(
      {super.key,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.suffixIcon,
      this.hintText,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        controller: controller,
        style: TextStyles.fontCircularSpotify12GrayRegular,
        cursorColor: AppPallete.darkVividVioletColor,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyles.fontRoboto17AccentBlackRegular,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.78.r),
            borderSide: const BorderSide(
                width: 2.46, color: AppPallete.mediumGrayColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.78.r),
            borderSide: const BorderSide(
                width: 2.46, color: AppPallete.mediumGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.78.r),
            borderSide: const BorderSide(width: 2.46, color: AppPallete.green),
          ),
        ));
  }
}
