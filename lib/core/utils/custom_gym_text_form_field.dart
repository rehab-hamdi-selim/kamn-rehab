import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';
import 'package:kamn/core/utils/custome_text_form_field.dart';

class CustomGymTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? helper;
  final String? optionalText;
  final TextEditingController? controller;
  final int? maxLine;
  final int? maxLength;
  final MyValidator? valodator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool? enable;

  const CustomGymTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.maxLine,
    this.maxLength,
    this.helper,
    this.optionalText,
    this.valodator,
    this.inputFormatters,
    this.suffix,
    this.keyboardType,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          enabled: enable,
          controller: controller,
          validator: valodator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: suffix,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppPallete.tooLightGray.withOpacity(0.5),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            hintText: hint,
            helperText: helper,errorStyle: TextStyles.fontCircularSpotify10RedMedium,
            hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 12.h),
            helperStyle: TextStyles.fontCircularSpotify10StealGrayMedium,
            fillColor: enable == true ? AppPallete.whiteColor : Colors.grey.shade200,
            filled: true,
          ),
          maxLines: maxLine,
          maxLength: maxLength,
          buildCounter: maxLength != null
              ? (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) {
                  return Text(
                    '$currentLength/($maxLength) character',
                    style: TextStyle(
                        fontSize: 8,
                        color: currentLength == maxLength
                            ? AppPallete.redColor
                            : AppPallete.darkGreyColor),
                  );
                }
              : null,
        ),
      ],
    );
  }
}
