import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class CustomTextFieldItem extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final Widget? suffixIcon;
  final bool isObscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextFieldItem(
      {super.key, required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: TextStyles.fontInter14BlackMedium,
          textAlign: TextAlign.start,
        ),
        verticalSpace(2),
        TextFormField(
          decoration: InputDecoration(
              fillColor: AppPallete.whiteColor,
              filled: true,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
              hintText: hintText,
              hintStyle: TextStyles.fontInter14GreyRegular,
              suffixIcon: suffixIcon),
          style: const TextStyle(color: AppPallete.dartBlackColor),
          validator: validator,
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}
