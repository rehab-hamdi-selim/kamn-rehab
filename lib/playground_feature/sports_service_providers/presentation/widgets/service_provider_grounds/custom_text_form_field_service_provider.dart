import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/constants.dart';
import '../../../../../core/theme/app_pallete.dart';

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
    return TextFormField(
      controller: controller,
      cursorColor: AppPallete.greenColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        filled: true,
        fillColor: AppPallete.ofWhiteColor,
        hintText: Constants.hintTextForSearch,
        hintStyle: const TextStyle(color: AppPallete.grayColor),
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
          borderSide: const BorderSide(color: AppPallete.greenColor),
        ),
      ),
      onChanged: onChange,
    );
  }
}
