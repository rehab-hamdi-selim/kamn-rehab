import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import '../../../../../core/const/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChange;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextFormField(
        controller: controller,
        cursorColor: AppPallete.darkGreenColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
          filled: true,
          fillColor: AppPallete.ofWhiteColor,
          hintText: Constants.hintTextForSearch,
          hintStyle: TextStyles.fontCircularSpotify10Gray2Regular
              .copyWith(fontSize: 12.h),
          prefixIcon: const Icon(
            Icons.search,
            color: AppPallete.grayColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPallete.ofWhiteColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPallete.ofWhiteColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: AppPallete.darkGreenColor),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
