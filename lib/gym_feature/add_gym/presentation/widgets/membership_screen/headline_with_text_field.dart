import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/core/theme/style.dart';

class HeadlineWithTextField extends StatelessWidget {
  const HeadlineWithTextField({
    super.key,
    required this.headLine,
    required this.subtitle,
    required this.hintText,
     this.controller, this.optionalText,
  });

  final String headLine;
  final String subtitle;
  final String hintText;
  final String? optionalText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Headline Text
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: headLine),
                TextSpan(
                  text: optionalText,
                  style: TextStyles.fontCircularSpotify12GrayRegular
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyles.fontCircularSpotify16BlackMedium.copyWith(
              color: AppPallete.accentBlackColor,
            ),
          ),
          // Subtitle Text
          Text(
            subtitle,
            style: TextStyles.fontCircularSpotify10darkGreyColorRegular.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          // TextField
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.fontCircularSpotify12GrayRegular,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.89.h,
                vertical: 11.75.h,
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
          ),
        ],
      ),
    );
  }
}
